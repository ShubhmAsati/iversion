import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iversion/database/my_contacts_box_handler.dart';
import 'package:iversion/models/my_chat_list_box.dart';
import 'package:iversion/models/my_contacts_box.dart';
import 'package:iversion/pages/video_call/video_call.dart';

class ChatController {
  static startVideoCall(
      MyChatListBoxModel chatBoxDetails, BuildContext context) {
    //getPartipantsList
    if (chatBoxDetails.isGroup) {
      //TODO: handle group calling
    } else {
      String userId = chatBoxDetails.toUserId;
      List<MyContactsBoxModel> participants = [
        MyContactsBoxHandler.getUserByUserId(userId)
      ];
      print("Executing video calling widget");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VideoCallingWidget(
                    participants: participants,
                  )));
    }
  }

  static cleanUpRTCResourcesIfAny() {}
}
