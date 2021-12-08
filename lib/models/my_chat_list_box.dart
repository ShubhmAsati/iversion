import 'package:hive/hive.dart';

part 'my_chat_list_box.g.dart';

@HiveType(typeId: 4)
class MyChatListBoxModel extends HiveObject{
  @HiveField(0)
  String chatId;
  @HiveField(1)
  String lastMessage;
  @HiveField(2)
  int unReadCount;
  @HiveField(3)
  String lastOpenedTimeStamp;
  @HiveField(4)
  bool isGroup;
  @HiveField(5)
  String toUserId;
  MyChatListBoxModel({this.chatId,this.lastMessage,this.unReadCount,this.lastOpenedTimeStamp,this.isGroup,this.toUserId});
  @override
  String toString(){
    return "Userid = "+ this.toUserId + ", chatId = " + this.chatId + ", isGroup" + this.isGroup.toString() + " last message= "+ this.lastMessage;
  }
}