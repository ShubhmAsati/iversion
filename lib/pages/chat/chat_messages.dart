import 'package:flutter/material.dart';
import 'package:iversion/database/chat_messages_box_handler.dart';
import 'package:iversion/database/my_details_box_handler.dart';
import 'package:iversion/models/chat_messages_box.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iversion/models/my_chat_list_box.dart';

class ChatMessages extends StatefulWidget {
  MyChatListBoxModel chatBoxDetails;
  ChatMessages({this.chatBoxDetails});
  @override
  _ChatMessagesState createState() =>
      _ChatMessagesState(chatBoxDetails: chatBoxDetails);
}

class _ChatMessagesState extends State<ChatMessages> {
  MyChatListBoxModel chatBoxDetails;
  bool _showNewMessagesIcon = false;
  Future chatMessagesFuture;
  _ChatMessagesState({this.chatBoxDetails});
  ScrollController _chatMessagesScrollController;
  @override
  void initState() {
    _chatMessagesScrollController = new ScrollController();
    chatMessagesFuture= ChatMessagesBoxHandler.openBox(chatBoxDetails.chatId);
   // CountDownTimer();
  }

  @override
  void dispose() {
    _chatMessagesScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    print("building chat messages");
    print(chatBoxDetails.chatId);
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 90),
      child: Stack(children: [
        FutureBuilder(
          future: chatMessagesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Text("Something bad happened");
              }
              return buildChatBoxes(context, chatBoxDetails.chatId);
            }
            return Container();
          },
        ),
        _showNewMessagesIcon
            ? Positioned(
                bottom: size.height * 0.1,
                right: size.width * 0.02,
                child: Container(),
              )
            : SizedBox(
                height: 0,
                width: 0,
              ),
      ]),
    );
  }

  buildChatBoxes(BuildContext context, String chatId) {
    var size = MediaQuery.of(context).size;
    return WatchBoxBuilder(
        box: ChatMessagesBoxHandler.getBox(chatId),
        builder: (context, messages) {
          return Container(
            child: ListView.builder(
                reverse: true,
                controller: _chatMessagesScrollController,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return generateChatBoxes(
                      messages.getAt(messages.length - index - 1));
                }),
          );
        });
  }

  Container generateChatBoxes(ChatMessagesBoxModel msg) {
    return Container(
        padding: EdgeInsets.fromLTRB(15, 5, true ? 10 : 40, 5),
        color: Colors.transparent,
        child: Align(
          alignment: msg.fromUserId==MyDetailsBoxHandler.userId ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(
                  color: msg.fromUserId==MyDetailsBoxHandler.userId ? Colors.teal[900] : Colors.grey[800],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(msg.fromUserId==MyDetailsBoxHandler.userId ? 15 : 0),
                    topRight: Radius.circular(msg.fromUserId==MyDetailsBoxHandler.userId ? 0 : 15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  )),
              child: new RichText(
                text: TextSpan(
                    text: msg.message,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: '    '),
                      TextSpan(
                          text:getLocalTImeFromUTC(msg.sentTimeStamp),
                          style: TextStyle(fontSize: 8, color: Colors.white54))
                    ]),
              )),
        ));
  }

  getLocalTImeFromUTC(timeStamp){
    try{
      return DateTime.parse(timeStamp).toLocal().toString();
    }catch(er){
      return " ";
    }
  }
  goToEndOfChatbox() {
    _chatMessagesScrollController
        .jumpTo(_chatMessagesScrollController.position.maxScrollExtent);
  }



  CountDownTimer() async {
    for (int i = 0; i < 3; i++) {
      await Future.delayed(Duration(seconds: 5)).then((_) {
          var msg = ChatMessagesBoxModel(fromUserId:chatBoxDetails.toUserId.toString(), toUserId:MyDetailsBoxHandler.userId,message: "round3");
          ChatMessagesBoxHandler.addMessageToChatbox(msg, chatBoxDetails.chatId);
      });
    }
  }
}
