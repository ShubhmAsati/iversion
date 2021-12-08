import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:iversion/consts/error_codes.dart';
import 'package:iversion/models/my_chat_list_box.dart';
import 'package:iversion/pages/chat/chat.dart';
import 'package:iversion/utils/error/exceptions.dart';
import 'package:iversion/models/my_chat_list_box.dart';

class MyChatListBoxHandler {
  static final String boxName = 'chat-boxes';
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

  static openBox() {
    return Hive.openBox(boxName);
  }

  static closeBox() {
    Hive.box(boxName).close();
  }

  static List<dynamic> getAllChatHistory() {
    print("getting all chatboxes");
    return Hive.box(boxName).values.toList();
  }

  static createOrUpdateChat(MyChatListBoxModel newChat) {
    print(newChat.toString());
    if (Hive.box(boxName).containsKey(newChat.chatId)) {
      MyChatListBoxModel chBox = Hive.box(boxName).get(newChat.chatId);
      newChat.unReadCount += chBox.unReadCount;
    }
    Hive.box(boxName).put(newChat.chatId, newChat);
  }

  static bool isChatIdExists(String chatId) {
    print("checkin if chatId exists or not");
    var chatDetails = Hive.box(boxName).get(chatId);
    if (chatDetails == null) {
      return false;
    }
    return true;
  }
}
