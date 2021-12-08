import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:grpc/grpc.dart' as grpc;
import 'package:iversion/database/chat_messages_box_handler.dart';
import 'package:iversion/database/my_chat_list_box_handler.dart';
import 'package:iversion/database/my_contacts_box_handler.dart';
import 'package:iversion/database/my_details_box_handler.dart';
import 'package:iversion/grpc/message/message_service.pbgrpc.dart';
import 'package:iversion/models/chat_messages_box.dart';
import 'package:iversion/models/my_chat_list_box.dart';
import 'package:iversion/pages/chat/chat_controller.dart';
import 'package:iversion/pages/chat/chat_messages.dart';
import 'package:iversion/utils/grpc_channel/grpc_channel.dart';
import 'package:uuid/uuid.dart';

class ChatBox extends StatefulWidget {
  MyChatListBoxModel chatBoxDetails;
  ChatBox({this.chatBoxDetails});
  @override
  _ChatBoxState createState() => _ChatBoxState(chatBoxDetails: chatBoxDetails);
}

class _ChatBoxState extends State<ChatBox> {
  MyChatListBoxModel chatBoxDetails;
  _ChatBoxState({this.chatBoxDetails});
  List<String> chatBackgroundList = [
    'background-1.jpg',
  ];
  String chatBackGroundPrefixPath = "chat_backgrounds";
  String my_background;
  String userFirstNameOrGroupTitle;
  String userNameOrGroupStatus;
  String userOrGroupProfilePic;
  Future<void> usersOrGroupFuture;
  @override
  void initState() {
    my_background = pickRandomChatWallpaper();
    usersOrGroupFuture = loadUserOrGroupData();
    resetUnreadCount();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var scaffold = Scaffold(
        appBar: getAppBar(),
        body: _getChatBoxBody(size),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: BottomBarForTextInput(
          chatBoxDetails: chatBoxDetails,
        ));
    return scaffold;
  }

  _getChatBoxBody(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _getUserDataWidget(),
        Expanded(child: _getChatMessagesWidget(size))
      ],
    );
  }

  String pickRandomChatWallpaper() {
    var rng = new Random();
    return 'assets/' + chatBackGroundPrefixPath + "/" + chatBackgroundList[0];
  }

  GradientAppBar getAppBar() {
    return GradientAppBar(
      backgroundColorStart: Theme.of(context).primaryColor,
      backgroundColorEnd: Colors.green,
      leading: BackButton(
        color: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      titleSpacing: 0,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(
            Icons.video_call,
            color: Colors.white,
          ),
          onPressed: () {
            _startVideoCall();
          },
        ),
        IconButton(
          icon: Icon(Icons.more_vert, color: Colors.white54),
        ),
      ],
    );
  }

  _startVideoCall() {
    ChatController.startVideoCall(chatBoxDetails, context);
  }

  _getUserDataWidget() {
    return Center(
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Theme.of(context).primaryColor, Colors.green])),
          child: FutureBuilder(
              future: usersOrGroupFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return Container(child: Text("Something went wrong"));
                  }
                  return Center(
                    child: ListTile(
                      title: new Text(
                        '$userNameOrGroupStatus',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      subtitle: new Text(
                        '$userFirstNameOrGroupTitle ',
                        style: TextStyle(color: Colors.white70),
                      ),
                      trailing: Container(
                        width: 60,
                        height: 60,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            border: new Border.all(
                              color: Colors.green,
                              width: 4.0,
                            ),
                            color: Colors.green),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/batman.jpg'),
                        ),
                      ),
                    ),
                  );
                } else {
                  return new Container();
                }
              })),
    );
  }

  _getChatMessagesWidget(Size size) {
    return Container(
        width: size.width,
        child: ChatMessages(
          chatBoxDetails: chatBoxDetails,
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(my_background), fit: BoxFit.fill)));
  }

  Future<void> loadUserOrGroupData() async {
    if (chatBoxDetails.isGroup) {
      //TODO: handler group here
    } else {
      try {
        var userDetails =
            MyContactsBoxHandler.getUserByUserId(chatBoxDetails.toUserId);
        print("got user details");
        print(userDetails);
        userFirstNameOrGroupTitle = userDetails.firstName;
        userNameOrGroupStatus = "@" + userDetails.userName;
        userOrGroupProfilePic = userDetails.profilePic;
        return;
      } catch (er) {
        print(er);
        throw er;
      }
    }
  }

  resetUnreadCount() {
    var chBox = MyChatListBoxHandler.getBox();
    MyChatListBoxModel chMod = chBox.get(chatBoxDetails.chatId);
    chMod.unReadCount = 0;
    MyChatListBoxHandler.createOrUpdateChat(chMod);
  }
}

class BottomBarForTextInput extends StatelessWidget {
  MyChatListBoxModel chatBoxDetails;
  TextEditingController _chatMessageController = new TextEditingController();
  BottomBarForTextInput({this.chatBoxDetails});

  @override
  void dispose() {
    _chatMessageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        width: size.width,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                  padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: TextField(
                    controller: _chatMessageController,
                    keyboardType: TextInputType.text,
                    maxLines: 3,
                    minLines: 1,
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      hintText: 'Start Typing',
                      hintStyle: TextStyle(color: Colors.white70, fontSize: 15),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[900],
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey[900],
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: Colors.grey[800],
                      filled: true,
                    ),
                  )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: IconButton(
                    icon: Icon(Icons.send, size: 40, color: Colors.tealAccent),
                    onPressed: () {
                      sendMessage();
                    },
                  )),
            )
          ],
        ));
  }

  sendMessage() {
    try {
      String message = _chatMessageController.text;
      print("Sending message to user");
      ChatMessagesBoxModel msg = ChatMessagesBoxModel(
          fromUserId: MyDetailsBoxHandler.userId,
          toUserId: chatBoxDetails.toUserId.toString(),
          message: message,
          sentTimeStamp:
              DateTime.parse(DateTime.now().toString()).toUtc().toString(),
          receivedTimeStamp: '');
      print(chatBoxDetails.chatId);
      print(message);
      print(chatBoxDetails.toUserId);
      ChatMessagesBoxHandler.addMessageToChatbox(msg, chatBoxDetails.chatId);
      //TODO: handle grpc calling for sending messages
      var messageStub = MessageClient(GrpcClientChannel.getChannel(),
          options: grpc.CallOptions(timeout: Duration(seconds: 120)));
      var newMessaage = Msg()
        ..msgId = Uuid().v1()
        ..message = message
        ..utcTimestamp = DateTime.now().millisecondsSinceEpoch.toString();
      var messagePayload = UserChatMessage()
        ..fromUserId = MyDetailsBoxHandler.userId
        ..toUserId = chatBoxDetails.chatId
        ..isGroup = chatBoxDetails.isGroup
        ..sentUtcTimeStamp = DateTime.now().millisecondsSinceEpoch.toString()
        ..chatId = chatBoxDetails.chatId
        ..nt = UserChatMessage_notification_type.MESSAGE
        ..msg = newMessaage;
      var responseSendMessage = messageStub.sendMessage(messagePayload);
      print(responseSendMessage);
      _chatMessageController.text = '';
    } catch (er) {
      print(er);
    }
  }
}
