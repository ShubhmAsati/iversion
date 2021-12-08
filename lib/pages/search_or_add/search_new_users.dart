import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iversion/consts/ui_pages.dart';
import 'package:iversion/database/my_chat_list_box_handler.dart';
import 'package:iversion/database/my_contacts_box_handler.dart';
import 'package:iversion/database/my_details_box_handler.dart';
import 'package:iversion/models/my_chat_list_box.dart';
import 'package:iversion/models/my_contacts_box.dart';
import 'package:iversion/pages/chat/chat.dart';
import 'package:iversion/pages/search_or_add/search_new_users_controller.dart';

import 'package:uuid/uuid.dart';

class SearchNewUsers extends StatefulWidget {
  @override
  _SearchNewUsersState createState() => _SearchNewUsersState();
}

class _SearchNewUsersState extends State<SearchNewUsers> {
  TextEditingController _searchByUserNameController;
  List<MyContactsBoxModel> searchUserResult=new List();
  @override
  void initState() {
    super.initState();
    _searchByUserNameController = new TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchByUserNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GradientAppBar(
        title: Text(
          "Search",
          style: new TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w200),
        ),
        centerTitle: true,
        elevation: 1,
        backgroundColorStart: Theme.of(context).primaryColor,
        backgroundColorEnd: Colors.green,),

      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _getSearchBar(size),
            Expanded(
              child: _getSearchListWidget()
            )
          ],
        ),
      ),
    );
  }

  _getSearchBar(Size size) {
    return Container(
      decoration:  BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Theme.of(context).primaryColor, Colors.green])),
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Center(
        child: Container(
            width: size.width * 0.8,
            height: 50,
            child: TextField(
              onEditingComplete: (){
                //handle this event
                print("Editing completed");
                _getSearchResult(_searchByUserNameController.text.trim());
              },
              onChanged: (searchText){
                print(searchText);
              },
              autofocus: true,
              controller: _searchByUserNameController,
              cursorColor: Colors.grey[800],
              cursorRadius: Radius.zero,
              style: new TextStyle(color: Colors.black,letterSpacing: 1.2),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical:2),
                fillColor: Colors.white,
                  filled: true,
                  suffixIcon: IconButton(
                   icon: Icon(
                    Icons.search,
                    color: Colors.grey[800]
                   ),
                    onPressed: (){
                     print("icon pressed");
                     _getSearchResult(_searchByUserNameController.text.trim());
                    },
                  ),
                  hintText: "Search @shubham @oreo",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.1,
                    fontSize: 13
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[400], width: 1),
            borderRadius: BorderRadius.all(Radius.circular(5))),

                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide(color: Colors.grey[400], width: 1))),
            ),
          ),

        ),
      );
  }

  _getSearchListWidget(){
    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: searchUserResult.length,
          itemBuilder:(BuildContext context,int index){
           return profileBuilder(context,searchUserResult[index]);
      })
    );
  }
  _getSearchResult(String searchText){
     SearchUserController.searchUser(searchText).then((value) {
          setState(() {
            searchUserResult=value;
          });
     }).catchError((onError){
       print("error while getting users");
       print(onError);
     });
  }

  profileBuilder(BuildContext context, MyContactsBoxModel contact) {
    var size = MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      borderOnForeground: true,
      color: Colors.white,
      child: SizedBox(
        child: ListTile(
            onTap: () {
              goToChatBox(contact);
            },
            title: new Text(contact.firstName,
                style: new TextStyle(
                  fontSize: 20,
                  color: Colors.teal,
                )),

            autofocus: true,
            subtitle: new Text(
              '@'+contact.userName,
              style: TextStyle(color: Colors.teal[800],
              fontWeight: FontWeight.bold),
            ),
            leading: CircleAvatar(
              radius: 25,
              backgroundImage:
                 AssetImage('assets/batman.jpg'),

            )),
      ),
    );
  }


  goToChatBox(MyContactsBoxModel myContact) async {
    try {
      print("chatting with user $myContact.userName");
      //first add this user to MyContactListBoxHandler
      MyContactsBoxHandler.addUser(myContact);
      print(myContact.userId);
      print(myContact.userName);
      var myChatList = MyChatListBoxHandler.getAllChatHistory();
      if (myChatList.length == 0) {
        //this user hasn't chatted with anyone
        //create a chatbox with an id
        print("i had not chatted with anyone this is the first time");
        MyChatListBoxModel cb = new MyChatListBoxModel(
          chatId: myContact.userId,
          lastMessage: "",
          unReadCount: 0,
          lastOpenedTimeStamp: '0',
          isGroup: false,
          toUserId: myContact.userId,
        );
        print("Updating the chat list box");
        print(cb);

        MyChatListBoxHandler.createOrUpdateChat(cb);
        Navigator.pop(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatBox(
                      chatBoxDetails: cb,
                    )));
      } else {
        //check if this user is present in existing chats
        var chatbox = myChatList
            .where((element) => element.toUserId == myContact.userId)
            .toList();
        if (chatbox.length == 0) {
          //this is first time chatting
          print("This is the first time communication between $MyDetailsBoxHandler.userName and $myContact.userName");
          MyChatListBoxModel cb = new MyChatListBoxModel(
            chatId: myContact.userId,
            lastMessage: "",
            unReadCount: 0,
            lastOpenedTimeStamp: '0',
            isGroup: false,
            toUserId: myContact.userId,
          );
          MyChatListBoxHandler.createOrUpdateChat(cb);
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatBox(
                        chatBoxDetails: cb,
                      )));
        } else {
          print("I have already chatted with this user $myContact.userName");
          //already chatted
          Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChatBox(
                        chatBoxDetails: chatbox.first,
                      )));
          //and chat Id is already present for this guy
          //redirect it to chatId
        }
      }
      print("got all chat boxes");
    } catch (er) {
      print(er);
      print("Error while going to chat box check check above message");
    }
  }
}
