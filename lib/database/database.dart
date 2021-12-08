import 'dart:io';
import 'package:hive/hive.dart';
import 'package:iversion/database/my_details_box_handler.dart';
import 'package:iversion/models/my_chat_list_box.dart';
import 'package:iversion/models/my_contacts_box.dart';
import 'package:iversion/models/my_details_box.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:iversion/models/chat_messages_box.dart';

class Database {
  static Directory databaseFilesPath;
  static initializeHive() async {
    try {
      databaseFilesPath =
          await path_provider.getApplicationDocumentsDirectory();
      Hive.init(databaseFilesPath.path);
    } catch (er) {
      throw (er);
    }
  }

  static Future<Box<dynamic>> openHiveBox(String boxName) async {
    return Hive.openBox(boxName);
  }

  static closeHiveBox(String boxName) async {
    bool isExist = await Hive.boxExists(boxName);
    if (isExist) {
      Hive.box(boxName).close();
    } else {
      print('hive box does not exist :' + boxName);
    }
    return;
  }

  static registerAdapters(){
    Hive.registerAdapter(MyDetailsBoxModelAdapter());
    Hive.registerAdapter(MyContactsBoxModelAdapter());
    Hive.registerAdapter(MyChatListBoxModelAdapter());
    Hive.registerAdapter(ChatMessagesBoxModelAdapter());
  }
  static setupHive()async{
    try {
      await initializeHive();
    }catch(er) {
      print("cannot load hive database");
      print(er);
      return;
    }
    Database.registerAdapters();
  }
  static Future deleteBox(boxName) async{
    print("inside delete box");
    await Hive.deleteBoxFromDisk(boxName);
    print("box deleted");
  }
}
