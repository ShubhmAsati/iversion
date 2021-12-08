import 'package:iversion/consts/ui_pages.dart';
import 'package:flutter/material.dart';

class AwwSnap extends StatefulWidget {
  @override
  _AwwSnapState createState() => _AwwSnapState();
}

class _AwwSnapState extends State<AwwSnap> {
  @override
  Widget build(BuildContext context) {
    Map<String,dynamic> data = ModalRoute.of(context).settings.arguments;
    print(data['err']);
   var err = data['err'];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(err.errorCode),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey[900],
        textTheme: TextTheme(
            headline1: TextStyle(
                color: Colors.white54
            )
        ),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                flex:8,
                child: SizedBox(
                  height: 0,
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                        width:20
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Image(
                      image: AssetImage("assets/snap.jpg"),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                        width:20
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 0,
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: SizedBox(
                      width: 0,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Text(err.err.toString(),
                      style: TextStyle(
                          fontSize: 27,
                          color: Colors.grey
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: SizedBox(
                      width: 0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      width: 0,
                    ),
                  ),
                  Expanded(
                    flex:4,
                    child: Text(err.toString(),
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 22
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 15,
                child: SizedBox(
                  height: 0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, UiPages.init);
                    },
                    color: Colors.teal[500],
                    child: Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                              Icons.arrow_back
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(err.errorMessage),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 5,
                child: SizedBox(
                  height: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
