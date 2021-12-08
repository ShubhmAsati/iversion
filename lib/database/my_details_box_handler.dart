import 'package:hive/hive.dart';
import 'package:iversion/consts/error_codes.dart';
import 'package:iversion/models/my_details_box.dart';
import 'package:iversion/utils/error/exceptions.dart';

class MyDetailsBoxHandler {
  static String userId;
  static String userName;
  static String mobileNo;
  static String status;
  static String firstName;
  static final String boxName = 'my-box';

  static Future<bool> isBoxExists() async {
    try {
      bool exists = await Hive.boxExists(boxName);
      return exists;
    } catch (er) {
      throw er;
    }
  }

  static Box<dynamic> getBox() {
    return Hive.box(boxName);
  }

  //apparently this box is supposed to have zero index value
  static MyDetailsBoxModel getMyDetails() {
    print("inside get my details");
    return Hive.box(boxName).getAt(0);
  }

  //updates the user details of the box and change the static values
  static updateMyDetails(MyDetailsBoxModel myDetails) {
    Hive.box(boxName).putAt(0, myDetails);
    loadDetails();
  }

  static openBox() {
    return Hive.openBox(boxName);
  }

  static AddUserDetails(MyDetailsBoxModel myDetails) async {
    try {
      //wait for the box to open
      await Hive.openBox(boxName);
      if (Hive.box(boxName).length > 0) {
        //if user details already exist then silently return
        print("user already exists");
        return;
      }
      var resp = Hive.box(boxName).add(myDetails);
      print("adding user completed");
      print(resp);
    } catch (onError) {
      print("error while adding user" + onError.toString());
      throw onError;
    }
  }

  static Future<void> closeBox() async {
    await Hive.box(boxName).close();
  }

  static loadDetails() {
    try {
      print("loading my details");
      MyDetailsBoxModel md = Hive.box(boxName).getAt(0);
      userId = md.userID;
      userName = md.userName;
      mobileNo = md.mobileNo;
      status = md.status;
      firstName = md.firstName;
      print("loaded my details");
    } catch (er) {
      print("error while loading my details $er.toString()");
    }
  }
}
