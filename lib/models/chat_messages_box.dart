
import 'package:hive/hive.dart';

part 'chat_messages_box.g.dart';

@HiveType(typeId: 1)
class ChatMessagesBoxModel extends HiveObject{
  @HiveField(0)
  String fromUserId;
  @HiveField(1)
  String toUserId;
  @HiveField(2)
  String message;
  @HiveField(3)
  String sentTimeStamp;
  @HiveField(4)
  String receivedTimeStamp;
  ChatMessagesBoxModel({this.fromUserId,this.toUserId,this.message,this.sentTimeStamp,this.receivedTimeStamp});
}