import 'package:hive/hive.dart';
import 'package:iversion/models/chat_messages_box.dart';


class ChatMessagesBoxHandler {

  static Future<bool> isBoxExists(String boxName) async {
    try {
      bool exists = await Hive.boxExists(boxName);
      return exists;
    } catch (er) {
      throw er;
    }
  }

  static Future<Box<dynamic>> getorCreateBox(String boxName) async {
    try {
      bool exists = await isBoxExists(boxName);
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

  static Box<dynamic> getBox(String boxName) {
    return Hive.box(boxName);
  }

  static openBox(String boxName) {
    return Hive.openBox(boxName);
  }

  static closeBox(String boxName) {
    Hive.box(boxName).close();
  }

  static List<ChatMessagesBoxModel> getAllMessages(String boxName) {
    print("getting all messages");
    return Hive
        .box(boxName)
        .values
        .toList();
  }

  static addMessageToChatbox(ChatMessagesBoxModel msg, String boxName) {
    Hive.box(boxName).add(msg);
  }

  static firstOpenThenAddMessageToChatBox(ChatMessagesBoxModel msg,
      String boxName) async {
    try {
      bool exists = await Hive.boxExists(boxName);
      if (!exists) {
        if (Hive.isBoxOpen(boxName)) {

        } else {
          await Hive.openBox(boxName);
        }
      } else {
        await Hive.openBox(boxName);
      }
      Hive.box(boxName).add(msg);
    } catch (er) {
      print(er);
    }
  }
}