import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:iversion/database/my_details_box_handler.dart';
import 'package:iversion/pages/register/register_controller.dart';
import 'package:iversion/consts/ui_pages.dart';
import 'package:iversion/utils/internet_connectivity/internet_connectivity.dart';
import 'package:iversion/utils/common_methods/utils.dart';
import 'package:iversion/database/database.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void initState() {
    //TODO: check internet connection before making registration
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
        child: Scaffold(
      body: _getRegisterWidget(),
    ));
  }

  _getRegisterWidget() {
    return RegisterScaffoldBody();
  }
}

class RegisterScaffoldBody extends StatefulWidget {
  @override
  _RegisterScaffoldBodyState createState() => _RegisterScaffoldBodyState();
}

class _RegisterScaffoldBodyState extends State<RegisterScaffoldBody> {
  TextEditingController _mobileNumberController;
  TextEditingController _firstNameController;
  TextEditingController _userNameController;
  bool isMobileNoValid = false;
  final _formKey = GlobalKey<FormState>();
  bool _isRegistering = false;
  @override
  void initState() {
    super.initState();
    _firstNameController = new TextEditingController();
    _mobileNumberController = new TextEditingController();
    _userNameController = new TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _mobileNumberController.dispose();
    _userNameController.dispose();
    _firstNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isRegistering
        ? new Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.tealAccent,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
            ),
          )
        : SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Stack(children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 200,
                      width: 150,
                      child: Icon(
                        Icons.supervised_user_circle,
                        color: Colors.teal,
                      ),
                      decoration: BoxDecoration(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 0),
                              alignment: Alignment.topLeft,
                              child: new RichText(
                                  text: TextSpan(
                                text: 'Hi',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 100,
                                    fontWeight: FontWeight.bold),
                              ))),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 0),
                              alignment: Alignment.topLeft,
                              child: new RichText(
                                  text: TextSpan(
                                      text: 'There',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 100,
                                          fontWeight: FontWeight.bold),
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: "...",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 100,
                                        ))
                                  ]))),
                          Container(
                            padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
                            child: InternationalPhoneNumberInput(
                              textFieldController: _mobileNumberController,
                              autoFocus: true,
                              autoValidate: true,
                              keyboardAction: TextInputAction.done,
                              countries: ['IN', 'US', 'GB'],
                              onInputValidated: (bool value) {
                                isMobileNoValid = value;
                              },
                              inputDecoration: InputDecoration(
                                hintText: "Enter Mobile Number",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal)),
                                errorBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                              ),
                            ),
                          ),
                          Form(
                            key: _formKey,
                            child: Column(children: [
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 10),
                                  child: TextFormField(
                                    controller: _firstNameController,
                                    maxLines: 1,
                                    maxLength: 100,
                                    keyboardType: TextInputType.text,
                                    cursorColor: Colors.teal,
                                    validator: (String userName) {
                                      if (userName.length < 2) {
                                        return 'Invalid name';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 10),
                                      hintText: "Enter your name",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.teal)),
                                      errorBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                    ),
                                  )),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 0),
                                  child: TextFormField(
                                    controller: _userNameController,
                                    maxLines: 1,
                                    maxLength: 50,
                                    keyboardType: TextInputType.text,
                                    cursorColor: Colors.teal,
                                    validator: (String userName) {
                                      if (userName.length < 2) {
                                        return 'Invalid username';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 10),
                                      hintText: "Give us a unique username",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.teal)),
                                      errorBorder: UnderlineInputBorder(
                                          borderSide:
                                          BorderSide(color: Colors.red)),
                                    ),
                                  )),
                            ]),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                            child: RaisedButton(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 2),
                              onPressed: () {
                                if (_formKey.currentState.validate() &&
                                    isMobileNoValid) {
                                  register();
                                  //call register from here
                                  setState(() {
                                    _isRegistering = true;
                                  });
                                }
                              },
                              child: new Text(
                                'Next',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              elevation: 15,
                              color: Colors.teal,
                            ),
                          ),
                        ]),
                  )
                ]),
              ),
            ),
          );
  }

  void register() {
    try {
      var mobileNo = Utils.stripNonDigitCharactersAndCoutryCodeFromMobileNo(
          _mobileNumberController.text);
      var userName = _userNameController.text;
      var firstName = _firstNameController.text;
      //this function is supposed to call backend api to register user with username and mobile no
      if (!InternetConnectivity.isConnected) {
        print("not connected to internet");
        showSnackBar("Please check your network", Colors.white, Colors.red);
      } else {
        print("connected to internet");
        RegisterController rc =
            new RegisterController(mobileNo: mobileNo, userName: userName,firstName: firstName);
        rc.registerUser().then((userId) {
          print(userId);
          Navigator.pushNamedAndRemoveUntil(
              context, UiPages.main_page, (route) => false);
        }).catchError((onError) {

          showSnackBar(onError.toString(), Colors.white, Colors.red);
          setState(() {
            _isRegistering=false;
          });
        });
      }
    } catch (er) {
      showSnackBar("Something bad happened. Try again".toString(), Colors.white, Colors.red);
      setState(() {
        _isRegistering=false;
      });
    }

  }

  showSnackBar(String text, Color textColor, Color backgroundColor) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: new Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
      backgroundColor: backgroundColor,
    ));
  }
}
