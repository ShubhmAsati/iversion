import 'package:grpc/grpc.dart';
import 'package:iversion/consts/error_codes.dart';
import 'package:iversion/database/my_details_box_handler.dart';
import 'package:iversion/grpc/user/user_service.pb.dart' as user_model;
import 'package:iversion/grpc/user/user_service.pbgrpc.dart';
import 'package:iversion/models/my_details_box.dart';
import 'package:iversion/utils/error/exceptions.dart';
import 'package:iversion/utils/grpc_channel/grpc_channel.dart';

class RegisterController {
  String userName;
  String mobileNo;
  String firstName;
  RegisterController({this.userName, this.mobileNo, this.firstName});
  Future<String> registerUser() async {
    try {
      var grpcChannel = GrpcClientChannel.getChannel();
      print("grpc channel created");
      var userStub = UserServiceClient(grpcChannel,
          options: CallOptions(timeout: Duration(seconds: 120)));
      User requestUserData = user_model.User()
        ..firstName = this.firstName
        ..mobileNo = this.mobileNo
        ..userName = this.userName;
      print("sending add request");
      var resp = await userStub.add(requestUserData);
      print(resp);
      print("got response from server");
      //add user details to database
      MyDetailsBoxModel myDetails = new MyDetailsBoxModel(
          userName: userName, mobileNo: mobileNo, userID: resp.userId);
      print("user registered on backend");
      await MyDetailsBoxHandler.AddUserDetails(myDetails);
      print("user add in db");
      return resp.userId;
    } catch (er) {
      print(er);
      throw FailureError(
          errorCode: ErrorCode.failToRegisterUser,
          errorMessage: "Try again with different user name",
          err: er);
    }
  }
}
