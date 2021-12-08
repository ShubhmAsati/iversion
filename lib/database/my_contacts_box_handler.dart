import 'package:hive/hive.dart';
import 'package:iversion/consts/error_codes.dart';
import 'package:iversion/models/my_contacts_box.dart';
import 'package:iversion/utils/error/exceptions.dart';

//userId is the key and MyContactsBoxModel is the value

class MyContactsBoxHandler {
  //this box will have userId as key and details are its value
  static Box myContacts;
  static final boxName = 'my_contacts';

  static Future<bool> isBoxExists() async {
    try {
      bool exists = await Hive.boxExists(boxName);
      print(exists);
      return exists;
    } catch (er) {
      print(er);
      throw er;
    }
  }

  //gets a box , if not exists then it will open it.
  static Future<Box<dynamic>> getorCreateBox() async {
    try {
      bool exists = await isBoxExists();
      if (exists) {
        return Hive.box(boxName);
      } else {
        Box b = await Hive.openBox(boxName);
        return b;
      }
    } catch (er) {
      print(er);
      throw er;
    }
  }

  static Box<dynamic> getBox() {
    return Hive.box(boxName);
  }

  static Future<Box<dynamic>> openBox() async {
    return Hive.openBox(boxName);
  }

  List<MyContactsBoxModel> allMyContacts() {
    return Hive
        .box(boxName)
        .values
        .toList();
  }

  static closeBox() {
    Hive.box(boxName).close();
  }

  static addUser(MyContactsBoxModel myContacts) {
    print("adding user");
    Hive.box(boxName).put(myContacts.userId, myContacts);
  }

  static addUsers(Map<int, MyContactsBoxModel> myContacts) {
    print("adding all users");
    Hive.box(boxName).putAll(myContacts);
  }

  static MyContactsBoxModel getUserByUserId(String userId) {
    var usersDetails = Hive.box(boxName).get(userId);
    if (usersDetails != null) {
      return usersDetails;
    }
    throw FailureError(errorMessage: "cannot find the user in My contacts box",
        errorCode: ErrorCode.userDoesNotExistsInContactBox);
  }

  static bool isThisMobileAlreadyExists(String mobileNo) {
    try {
      List<dynamic> userDetails = Hive
          .box(boxName)
          .values
          .toList()
          .where((element) => element.mobileNo == mobileNo).toList();

      print(userDetails.length);
      if (userDetails.length == 0){
       return false;
      }
      return true;
    } catch (er) {
      print(er);
    }
    return false;
  }
  static MyContactsBoxModel getUserByMobile(String mobileNo){
    var userDetails = Hive.box(boxName).values.toList().where((element) => element.mobileNo==mobileNo).toList();
    if (userDetails.length==0){
      throw FailureError(errorCode: ErrorCode.userDoesNotExistsInContactBox,errorMessage: "Mobile No does not exists");
    }else{
      return userDetails.first;
    }
  }
}
