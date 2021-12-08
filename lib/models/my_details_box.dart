import 'package:hive/hive.dart';

part 'my_details_box.g.dart';

@HiveType(typeId: 2)
class MyDetailsBoxModel extends HiveObject {
  @HiveField(0)
  String userName;
  @HiveField(1)
  String status;
  @HiveField(2)
  String mobileNo;
  @HiveField(3)
  String userID;
  @HiveField(4)
  String profilePic;
  @HiveField(5)
  String firstName;

  MyDetailsBoxModel(
      {this.userName, this.status, this.mobileNo, this.userID, this.firstName});
}
