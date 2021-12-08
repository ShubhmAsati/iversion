import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:iversion/background_tasks/user_chat_messages_runner.dart';
import 'package:iversion/database/my_chat_list_box_handler.dart';
import 'package:iversion/database/my_contacts_box_handler.dart';
import 'package:iversion/database/my_details_box_handler.dart';
import 'package:iversion/pages/main_page/my_chat_boxes_list.dart';
import 'package:iversion/pages/search_or_add/search_new_users.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  PageController _pageViewController;

  @override
  void initState() {
    super.initState();
    //handle the creation of stream from server to client
    _pageViewController = new PageController();
    MyDetailsBoxHandler.loadDetails();
    //opening this box here as this will be need almost every where
    MyContactsBoxHandler.openBox();
    setupUserChatMessagesRunner();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    MyChatListBoxHandler.closeBox();
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return Scaffold(
      appBar: new GradientAppBar(
        title: Text(
          "Chat",
          style: new TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.w200),
        ),
        centerTitle: true,
        backgroundColorStart: Theme.of(context).primaryColor,
        backgroundColorEnd: Colors.green,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      //backgroundColor: Theme.of(context).primaryColor,
      body: MainPageScaffoldBody(),
      floatingActionButton: FloatingActionButton(
        child: CircleAvatar(
          backgroundColor: Colors.teal,
          radius: 30,
          child: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchNewUsers()));
            },
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            color: Theme.of(context).accentColor,
            focusColor: Colors.teal,
          ),
        ),
      ),
    );
  }

  //TODO: handle this more smartly
  setupUserChatMessagesRunner() async {
    print("printing my userid and username");
    print(MyDetailsBoxHandler.userId);
    print(MyDetailsBoxHandler.userName);
    UserChatMessagesRunner.startReceivingMessages();
    UserChatMessagesRunner
        .runTickerEveryMinuteToCheckIfMessageStreamingFailed();
  }
}

class MainPageScaffoldBody extends StatefulWidget {
  @override
  _MainPageScaffoldBodyState createState() => _MainPageScaffoldBodyState();
}

class _MainPageScaffoldBodyState extends State<MainPageScaffoldBody> {
  int selectedIndex = 0;
  List<String> actionList = ["Messages", "Group"];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Theme.of(context).primaryColor, Colors.green])),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _getNavBarOptions(),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(35), topLeft: Radius.circular(35)),
            ),
            child: _getMainBodyWidget(),
          ))
        ],
      ),
    );
  }

  _getNavBarOptions() {
    return Container(
      height: 65,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Theme.of(context).primaryColor, Colors.green])),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: actionList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 20, 30, 10),
                child: Text(
                  actionList[index],
                  style: new TextStyle(
                      color: (selectedIndex == index)
                          ? Colors.white
                          : Colors.white54,
                      fontSize: 20,
                      letterSpacing: 1.5,
                      fontWeight: (selectedIndex == index
                          ? FontWeight.bold
                          : FontWeight.w400)),
                ),
              ),
            );
          }),
    );
  }

  //this is the actual data shown
  _getMainBodyWidget() {
    if (selectedIndex == 0) {
      //return my chat list
      return _getMessagesMainBody();
    } else if (selectedIndex == 1) {
      //returns group widget
      return Container();
    }
  }

  _getMessagesMainBody() {
    return Column(children: [
      _getStories(),
      Expanded(
          child: Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: MyChatBoxList()))
    ]);
  }

  _getStories() {
    List<String> stories = [
      "me",
      "myself",
      "and",
      "I",
      "you",
      "bravo",
      "mogambo"
    ];
    return Container(
      child: Column(children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(30, 10, 0, 10),
              child: Text(
                "Stories",
                style: TextStyle(
                    color: Colors.grey[700],
                    letterSpacing: 1.5,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Container(
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 2),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Column(children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/batman.jpg'),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      stories[index],
                      style: TextStyle(
                          color: Colors.grey[800], letterSpacing: 1.3),
                    )
                  ]),
                );
              }),
        ),
      ]),
    );
  }
}
