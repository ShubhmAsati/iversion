//import 'package:flutter/material.dart';
//import 'package:hive/hive.dart';
//import 'package:iversion/database/database.dart';
//import 'package:iversion/models/chat_messages_box.dart';
//
//class Testing extends StatefulWidget {
//  @override
//  _TestingState createState() => _TestingState();
//}
//
//class _TestingState extends State<Testing> {
//  TextEditingController _textInputController1 = new TextEditingController();
//  TextEditingController _textInputController2 = new TextEditingController();
//  TextEditingController _textInputController3 = new TextEditingController();
//  String name;
//  Box box;
//  @override
//  void initState(){
//    super.initState();
//    box = Hive.box('testing');
//  }
//  void dispose(){
//    _textInputController1.dispose();
//    _textInputController2.dispose();
//    _textInputController3.dispose();
//    Database.closeHiveBox('testing');
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: new Text('Testing'),
//      ),
//      body:Column(
//        children: [
//          Container(
//            child: Text("hello")
//          ),
//          Container(
//          child: Text('$name')
//          ),
//          RaisedButton(
//            onPressed: (){
//              showData();
//            },
//          ),
//          TextField(
//            keyboardType: TextInputType.text,
//            controller: _textInputController1,
//            decoration: InputDecoration(
//              labelText: "from name"
//            ),
//          ),
//          TextField(
//            keyboardType: TextInputType.text,
//            controller: _textInputController2,
//            decoration: InputDecoration(
//                labelText: "to name"
//            ),
//          ),
//          TextField(
//            keyboardType: TextInputType.text,
//            controller: _textInputController3,
//            decoration: InputDecoration(
//                labelText: "Message"
//            ),
//          )
//        ],
//      ),
//      floatingActionButton: FloatingActionButton(
//        child: IconButton(
//          icon: Icon(
//            Icons.add
//          ),
//          onPressed: (){
//            print("hi Im=am");
//            print(_textInputController1.text);
//            print(_textInputController2.text);
//            print(_textInputController3.text);
//           //AddMessage(_textInputController1.text,_textInputController2.text,_textInputController3.text);
//          },
//        ),
//      ),
//    );
//  }
////  AddMessage(String from,to,message){
////    User fromUser = User(
////      name: from,
////      id: '1212',
////    );
////    User toUser = User(
////      name: to,
////      id: '2121'
////    );
////    Message msg = new Message(from: fromUser,to: toUser,message: message,sentTimeStamp: 121);
////    //box.add(msg);
////    try {
////     box.add(msg);
////    }catch(er){
////      print(er);
////    }
////    }
//  showData(){
//  Message msg = box.getAt(0);
//  print(msg.message);
//    setState(() {
//      name =msg.message;
//    });
//  }
//}
