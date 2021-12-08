import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iversion/database/my_details_box_handler.dart';
import 'package:iversion/pages/my_profile/my_profile_controller.dart';
import 'package:iversion/utils/image_picker/image_picker.dart';

class My_Profile extends StatefulWidget {
  @override
  _My_ProfileState createState() => _My_ProfileState();
}

class _My_ProfileState extends State<My_Profile> {
  bool showEditIcon = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController _userDetailsController = new TextEditingController();
  String name;
  String  status;
  @override
  void dispose(){
    super.dispose();
    _userDetailsController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    name = getName();
    status=getStatus();
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        print(currentFocus);
        currentFocus.unfocus();
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: new Text('Profile'),
          backgroundColor: Colors.grey[800],
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Container(
          color: Colors.black,
          height: size.height,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(alignment: Alignment.bottomRight, children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: GestureDetector(
                        onTap: () {
                          print("show big image");
                          showFullScreenProfilePic();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(150),
                          child: CircleAvatar(
                            radius: 150,
                            child: Image(
                              image: AssetImage('assets/batman.jpg'),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 30, 30),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.teal,
                        child: IconButton(
                          color: Colors.tealAccent,
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            print("editing image");
                           var im =  ImagePickerUtils();
                           im.getImageFromGallery().then((value) => null).catchError((onError){
                             print(onError);
                           });
                          },
                        ),
                      ),
                    )
                  ]),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ListTile(
                        onTap: () {
                          print("Im clicked");
                          showDialog(
                              context: context,
                              child: newDialog("Enter your name",updateName));
                        },
                        title: new Text(
                          'Name',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        subtitle: new Text(name??"Add a name",
                            style: TextStyle(color: Colors.white54)),
                        leading:
                            Icon(Icons.account_circle, color: Colors.white54),
                        trailing: IconButton(
                          icon: Icon(Icons.edit, color: Colors.white54),
                          onPressed: () {
                            print("icon clicked");
                          },
                        ),
                      )),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ListTile(
                        onTap: () {
                          print("Im clicked");
                          showDialog(
                              context: context,
                              child: newDialog("Enter your status",updateStatus));
                        },
                        title: new Text(
                          'Status',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        subtitle: new Text(status??"Add a status",
                            style: TextStyle(color: Colors.white54)),
                        leading: Icon(Icons.subject, color: Colors.white54),
                        trailing: IconButton(
                          icon: Icon(Icons.edit, color: Colors.white54),
                          onPressed: () {
                            print("icon clicked");
                          },
                        ),
                      )),
                  Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: ListTile(
//                        onTap: () {
//                          print("Im clicked");
//                          showDialog(
//                              context: context,
//                              child: newDialog("Change your mobile no"));
//                        },
                        title: new Text(
                          '8120387578',
                          style: TextStyle(
                            color: Colors.white70,
                          ),
                        ),
                        leading:
                            Icon(Icons.phone_android, color: Colors.white54),
                        trailing: IconButton(
                          icon: Icon(Icons.phone, color: Colors.white54),
                          onPressed: () {
                            print("icon clicked");
                          },
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  newDialog(String textToShow,Function update) {
    return Dialog(
      child: Container(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
          color: Colors.grey[900],
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Container(
                alignment: Alignment.topLeft,
                child: Text(textToShow,
                    style: TextStyle(color: Colors.white70, fontSize: 15))),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: TextField(
                  controller: _userDetailsController,
                  keyboardType: TextInputType.text,
                  maxLength: 20,
                  maxLengthEnforced: true,
                  style: TextStyle(color: Colors.white54),
                  cursorColor: Colors.tealAccent,
                  decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.tealAccent),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.tealAccent),
                    ),
                  ),
                )),
            Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      child: FlatButton(
                          color: Colors.grey[900],
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel',
                              style: TextStyle(color: Colors.tealAccent)))),
                  Container(
                      child: FlatButton(
                        onPressed: (){
                          update();
                        },
                          color: Colors.grey[900],
                          child: Text('Save',
                              style: TextStyle(color: Colors.tealAccent)))),
                ])
          ])),
    );
  }

  showFullScreenProfilePic() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.black,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                  body: Container(
                    color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Image(
                            //TODO: handle user profile pic here
                    image: AssetImage('assets/batman.jpg'),
                  ),
                        ),
                      )),
                )));
  }

  updateStatus(){
    var mpc = new MyProfileController(status: _userDetailsController.text);
    mpc.update().then((value){
      print("Successfully updated details");
      showSnackBar(Colors.green, "Updated");
      setState(() {
        status=MyDetailsBoxHandler.status;
      });
    }).catchError((onError){
      print(onError);
      showSnackBar(Colors.red, "Failed. Please try again");
    });
    Navigator.pop(context);
    _userDetailsController.text="";
  }
  updateName(){
    var mpc = new MyProfileController(name: _userDetailsController.text);
    mpc.update().then((value){
      print("Successfully updated details");
      showSnackBar(Colors.green, "Updated");
      setState(() {
        name=MyDetailsBoxHandler.userName;
      });
    }).catchError((onError){
      print(onError);
      showSnackBar(Colors.red, "Failed. Please try again");
    });
    Navigator.pop(context);
    _userDetailsController.text="";
  }
  updateMobileNo(){
   print("not possible to update mobile no");
  }
  showSnackBar(Color c , String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: c,
    ));
  }

  String getStatus(){
    if (MyDetailsBoxHandler.status == null){
      return 'Add a staus';
    }
    return MyDetailsBoxHandler.status;
  }
  String getName(){
   if (MyDetailsBoxHandler.userName == null){
     return 'Add a name';
   }
   return MyDetailsBoxHandler.userName;
  }
}



