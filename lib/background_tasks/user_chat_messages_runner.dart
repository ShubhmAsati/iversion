import 'dart:async';

import 'package:iversion/database/chat_messages_box_handler.dart';
import 'package:iversion/database/my_chat_list_box_handler.dart';
import 'package:iversion/database/my_contacts_box_handler.dart';
import 'package:iversion/database/my_details_box_handler.dart';
import 'package:iversion/grpc/message/message_service.pbgrpc.dart';
import 'package:iversion/grpc/user/user_service.pbgrpc.dart';
import 'package:iversion/models/chat_messages_box.dart';
import 'package:iversion/models/my_chat_list_box.dart';
import 'package:iversion/models/my_contacts_box.dart';
import 'package:iversion/pages/video_call/video_call_controller.dart';
import 'package:iversion/utils/error/exceptions.dart';
import 'package:iversion/utils/grpc_channel/grpc_channel.dart';

class UserChatMessagesRunner {
  static MessageClient userChatMessagesStub;
  static int userId;
  static bool isMessageStreamWorking = false;
  //this is bit too check if message streaming started by server of not for internet connectivity
  static bool isMessageStreamingStarted = false;
  static bool isTickerStopped = false;
  static initiateRunner() {
    print("initiating message client");
    try {
      userChatMessagesStub = MessageClient(GrpcClientChannel.getChannel());
      return;
    } catch (er) {
      //TODO in case of this errors out do we retry
      print("message client setup complete");
      print(er);
    }
    return;
  }

  static startReceivingMessages() async {
    print("starting recieving messages");
    if (userChatMessagesStub == null) {
      initiateRunner();
    }
    var request = UserById()..userId = MyDetailsBoxHandler.userId;
    //before starting a new streaming clean up this users connection from server
    print("cleaning up existing streaming");
    var resp = await userChatMessagesStub.removeConnection(request);
    print(resp);
    try {
      isMessageStreamWorking = true;
      await for (var message in userChatMessagesStub.connect(request)) {
        print("waiting for messages");
        print(message);
        handleMessage(message);
      }

      print("hello I have started message streaming");
    } catch (er) {
      print("error while recieving messages");
      print(er);
      //TODO: enhance this to say retry 2-3 times then retry after 10 min or something
      //right night if this fails it will be picked by ticker and if it fails again then ticker will keep picking it
      isMessageStreamWorking = false;
    }
  }

  static handleMessage(UserChatMessage message) async {
    if (message.nt == UserChatMessage_notification_type.WEBRTCEVENT) {
      handleWebRTCEvents(message);
    } else {
      //TODO:put the below logic in separate func
      ChatMessagesBoxModel newMessage = new ChatMessagesBoxModel(
        fromUserId: message.fromUserId,
        toUserId: message.toUserId,
        message: message.msg.message,
        sentTimeStamp: message.sentUtcTimeStamp,
      );
      if (message.isGroup) {
      } else {
        try {
          var userDetails =
              MyContactsBoxHandler.getUserByUserId(message.fromUserId);
          //user already exists
        } on FailureError {
          print("user does not exists");
          //get from user details from server
          var userStub = UserServiceClient(GrpcClientChannel.getChannel());
          var getUserByUserId = new getUserByUserIdRequest()
            ..userId = message.fromUserId;
          var resp = await userStub.getUserByUserId(getUserByUserId);

          //user does not exists add this user as
          MyContactsBoxModel newUser = new MyContactsBoxModel(
            userId: message.fromUserId,
            userName: resp.userName,
            firstName: resp.firstName,
            profilePic: resp.profilePic,
            status: resp.status,
            mobileNo: resp.mobileNo,
          );
          await MyContactsBoxHandler.addUser(newUser);
        } catch (er) {
          print("unexpected error $er.toString()");
          rethrow;
        }
        //create chatlist and chatbox then add this message
        MyChatListBoxModel cb = new MyChatListBoxModel(
          chatId: message.fromUserId,
          lastMessage: message.msg.message,
          unReadCount: 1,
          lastOpenedTimeStamp: '0',
          isGroup: false,
          toUserId: message.fromUserId,
        );
        MyChatListBoxHandler.createOrUpdateChat(cb);
        ChatMessagesBoxHandler.firstOpenThenAddMessageToChatBox(
            newMessage, message.fromUserId);
      }
    }
  }

  static cleanupAndRestartMessageStream() async {
    //set user chat messages to null
    userChatMessagesStub = null;
    startReceivingMessages();
  }

  static checkIfChannelIsActiveOtherwiseStartMessageStream() {
    if (userChatMessagesStub == null) {
      startReceivingMessages();
    }
  }

  static runTickerEveryMinuteToCheckIfMessageStreamingFailed() {
    print("starting ticker ");
    Timer.periodic(Duration(seconds: 60), (timer) {
      if (isTickerStopped) {
        print("stopping ticker");
        timer.cancel();
      }
      print("running every minute");
      print(isMessageStreamWorking);
      if (!isMessageStreamWorking) {
        cleanupAndRestartMessageStream();
      }
    });
  }

  static handleWebRTCEvents(UserChatMessage message) {
    print("Handling webrtc events");
    print(message.toString());
    print("voila");
    VideoCallController.listenForEvents(message);
  }
}
