import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iversion/database/my_chat_list_box_handler.dart';
import 'package:iversion/database/my_contacts_box_handler.dart';
import 'package:iversion/database/my_details_box_handler.dart';
import 'package:iversion/models/my_chat_list_box.dart';
import 'package:iversion/consts/ui_pages.dart';
import 'package:iversion/models/my_contacts_box.dart';
import 'package:iversion/pages/chat/chat.dart';
import 'package:iversion/utils/error/exceptions.dart';

class MyChatBoxList extends StatefulWidget {
  @override
  _MyChatBoxListState createState() => _MyChatBoxListState();
}

class _MyChatBoxListState extends State<MyChatBoxList> {
  Future myChatBoxFuture;
  List<dynamic> chatListBox = new List();
  @override
  void initState() {
    myChatBoxFuture = MyChatListBoxHandler.openBox();
    watchChanges();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("building chat list boxes");
    return FutureBuilder(
      future: myChatBoxFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Text("Something bad happened");
          }
          return buildListView(context);
        }
        return Container();
      },
    );
  }

  watchChanges() async {
    await MyChatListBoxHandler.openBox();
    MyChatListBoxHandler.getBox().watch().listen((BoxEvent event) {
      if (event.deleted) {
        print("Entry with key ${event.key} has been deleted.");
      } else {
        setState(() {
          print("just calling for nothing");
          chatListBox = null;
          print("resetting this so it can be picked next time");
        });
        print("Key ${event.key} is now associated with ${event.value}.");
      }
    });
  }

  Container buildListView(BuildContext context) {
    print("Building list view");
    print(chatListBox);
    chatListBox = MyChatListBoxHandler.getBox().values.toList();
    print(chatListBox);
    chatListBox.forEach((element) {
      print(element.lastMessage);
    });
    return new Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: chatListBox.length,
        itemBuilder: (context, index) {
          MyChatListBoxModel chatBox = chatListBox[index];
          print("inside list view");
          print(chatBox.lastMessage);
          return new ChatCard(
            chatBox: chatBox,
            lastMessage: chatBox.lastMessage,
          );
        },
      ),
    );
  }
}

class ChatCard extends StatefulWidget {
  MyChatListBoxModel chatBox;
  String lastMessage;
  ChatCard({this.chatBox, this.lastMessage});
  @override
  _ChatCardState createState() =>
      _ChatCardState(chatBox: this.chatBox, lastMessage: this.lastMessage);
}

class _ChatCardState extends State<ChatCard> {
  String userName;
  String lastMessage;

  MyChatListBoxModel chatBox;
  _ChatCardState({this.chatBox, this.lastMessage});
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: ListTile(
            onTap: () {
              goToChatBox(chatBox);
            },
            title: new Text(getChatCardTitle(chatBox),
                style: new TextStyle(
                    fontSize: 20, color: Colors.teal, letterSpacing: 1.3)),
            subtitle: getLastMessage(),
            trailing: getNoOfUnreadMessage(),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CircleAvatar(
                radius: 25,
                child: Image(
                  image:
                      AssetImage(getChatIcon(chatBox) ?? 'assets/batman.jpg'),
                ),
              ),
            )),
      ),
    );
  }

  goToChatBox(MyChatListBoxModel chatBox) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ChatBox(
                  chatBoxDetails: chatBox,
                )));
    //Navigator.popAndPushNamed(context, UiPages.chats,arguments:{'chatDetails':chatBox});
  }

  getChatCardTitle(MyChatListBoxModel chatBox) {
    print("getting chat card title");
    String title;
    if (chatBox.isGroup) {
      //TODO: handle group here
    } else {
      try {
        var userDetails =
            MyContactsBoxHandler.getUserByUserId(chatBox.toUserId.toString());
        title = '@' + userDetails.userName;
        print(title);
      } on FailureError {
        title = chatBox.toUserId.toString();
      }
    }
    return title;
  }

  getLastMessage() {
    String txt = " ";
    var chBox = MyChatListBoxHandler.getBox();
    MyChatListBoxModel chMod = chBox.get(chatBox.chatId);
    if (chMod.lastMessage == null || chMod.lastMessage == "") {
      var userDetails =
          MyContactsBoxHandler.getUserByUserId(chatBox.toUserId.toString());
      txt = userDetails.firstName;
      return new Text(
        txt,
        style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.bold),
      );
    }
    txt = chMod.lastMessage;
    return new Text(
      txt,
      style: TextStyle(
          color: chMod.unReadCount > 0 ? Colors.teal : Colors.grey,
          fontWeight: FontWeight.bold),
    );
  }

  getNoOfUnreadMessage() {
    var chBox = MyChatListBoxHandler.getBox();
    MyChatListBoxModel chMod = chBox.get(chatBox.chatId);
    if (chMod.unReadCount > 0) {
      return Container(
        child: Text(
          chMod.unReadCount.toString(),
          style: TextStyle(
            color: Colors.teal[600],
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    }
    return Container(
      height: 0,
      width: 0,
    );
  }

  getChatIcon(MyChatListBoxModel chatBox) {
    String chatIcon;
    if (chatBox.isGroup) {
      //TODO: handle group here
    } else {
      try {
        var userDetails =
            MyContactsBoxHandler.getUserByUserId(chatBox.toUserId.toString());
        chatIcon = userDetails.profilePic;
      } on FailureError {
        return null;
      }
    }
    return chatIcon == '' ? null : chatIcon;
  }
}
