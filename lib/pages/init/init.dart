import 'package:flutter/material.dart';
import 'package:iversion/consts/ui_pages.dart';
import 'package:iversion/database/my_details_box_handler.dart';
import 'package:iversion/database/database.dart';
import 'package:iversion/utils/permission_service/permission_service.dart';
import 'package:permission_handler/permission_handler.dart';
class Init extends StatefulWidget {
  @override
  _InitState createState() => _InitState();
}

class _InitState extends State<Init> {
  @override
  void initState(){
    initLoading();
  }
  String initBackgroundImage = 'assets/init/thomashelbyquote.png';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(initBackgroundImage), fit: BoxFit.fill))
      )
    );
  }
  
  initLoading(){    //setup reading from hive
    //check if my_box exist or not
    // if my box exist then open that box
    print("inside init loading");
    MyDetailsBoxHandler.isBoxExists().then((value) async{
      //sleeping for 5 seconds let the initial loading complete
      //TODO: increase this time to 5 sec or something
      await Future.delayed(Duration(seconds: 0));
      //request for permissions required for the app
      PermissionService ps = new PermissionService();
      ps.askForPermission(Permission.contacts);
      //permission block ends here
      if (value){
        print("my details box exists");
        //TODO: what to do if box exist and user details are not present
        //open box only in case user already exist and set/load his details
        await MyDetailsBoxHandler.openBox();
        Navigator.pushNamedAndRemoveUntil(context, UiPages.main_page, (route) => false);
      }else{
        Navigator.pushNamedAndRemoveUntil(context, UiPages.register, (route) => false);
      }
    }).catchError((onError){
       print(onError);
       Navigator.pushNamedAndRemoveUntil(context, UiPages.aww_snap, (route) => false);
    });
  }

  
}
