import 'package:hive/hive.dart';

part 'my_contacts_box.g.dart';

@HiveType(typeId: 3)
class MyContactsBoxModel{
  @HiveField(0)
  String firstName;
  @HiveField(7)
  String userName;
  @HiveField(1)
  String status;
  @HiveField(2)
  String mobileNo;
  @HiveField(3)
  String userId;
  @HiveField(4)
  String profilePic;
  @HiveField(6)
  String lastActiveTime;



  MyContactsBoxModel({this.firstName,this.status,this.mobileNo,this.userId,this.lastActiveTime,this.profilePic,this.userName});
}