import 'package:grpc/grpc.dart';
import 'package:iversion/grpc/user/user_service.pbgrpc.dart';
import 'package:iversion/models/my_contacts_box.dart';
import 'package:iversion/utils/grpc_channel/grpc_channel.dart';


class SearchUserController {
  static Future<List<MyContactsBoxModel>> searchUser(String searchText)async{
    try {
      var grpcChannel = GrpcClientChannel.getChannel();
      var userStub = UserServiceClient(
          grpcChannel, options: CallOptions(timeout: Duration(seconds: 10)));
      var request = getUserByUserNameRequest()
        ..userName = searchText;
      var resp = await userStub.searchUsersByUserName(request);
      List<MyContactsBoxModel>response =new List();
      resp.user.forEach((user) {
      response.add(MyContactsBoxModel(firstName: user.firstName,status: user.status,mobileNo: user.mobileNo,userName: user.userName,profilePic: user.profilePic,userId: user.userId));
      });
    return response;
    }catch(er){
      print(er);
          rethrow;
    }
  }


}
