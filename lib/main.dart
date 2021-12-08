import 'package:flutter/material.dart';
import 'package:iversion/consts/ui_pages.dart';
import 'package:iversion/database/database.dart';
import 'package:iversion/pages/init/init.dart';
import 'package:iversion/pages/main_page/main_page.dart';
import 'package:iversion/pages/register/register.dart';
import 'package:iversion/pages/video_call/video_call_reciever.dart';
import 'package:iversion/utils/internet_connectivity/internet_connectivity.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Database.setupHive();
  //await Database.deleteBox(MyDetailsBoxHandler.boxName);
  //await Database.deleteBox(MyContactsBoxHandler.boxName);
  //await Database.deleteBox(MyChatListBoxHandler.boxName);
  //TODO: need to find a better place to put this  because we are using this box in main page to get user details
  //await MyContactsBoxHandler.openBox();
  InternetConnectivity.setupConnectivityStream();
  runApp(MaterialApp(
    theme: ThemeData(
      // Define the default brightness and colors.
      brightness: Brightness.dark,
      primaryColor: Colors.teal[400],
      accentColor: Colors.tealAccent,
      backgroundColor: Colors.teal,
      // Define the default font family.
      fontFamily: 'Georgia',

      // Define the default TextTheme. Use this to specify the default
      // text styling for headlines, titles, bodies of text, and more.
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    ),
    navigatorKey: navigatorKey,
    initialRoute: UiPages.init,
    routes: {
      UiPages.main_page: (context) => MainPage(),
//        '/my-profile': (context) => My_Profile(),
//        '/chatbox' : (context)=> ChatBox(),
      //'/testing': (context)=> Testing(),
      UiPages.register: (context) => Register(),
      UiPages.init: (context) => Init(),
      UiPages.video_call: (context) => VideoCallReciever(),
//        UiPages.aww_snap: (context) => AwwSnap(),
//        UiPages.my_contacts: (context) => MyContacts(),
    },
  ));
}
