import 'package:grpc/grpc.dart';
import 'package:iversion/database/my_details_box_handler.dart';
import 'package:iversion/grpc/user/user_service.pbgrpc.dart';
import 'package:iversion/utils/grpc_channel/grpc_channel.dart';

class MyProfileController{
   String status;
   String name;
   MyProfileController({this.status,this.name});

   Future <void> update()async{
     try {
       var grpcChannel = GrpcClientChannel.getChannel();
       //TODO: set the timeout from someplace else..
       var userStub = UserServiceClient(
           grpcChannel, options: CallOptions(timeout: Duration(seconds: 4)));
       //get details from hive box
       var myDetails = MyDetailsBoxHandler.getMyDetails();
       print(this.status == null);
       if (this.status != null && this.status.isNotEmpty &&
           this.status.length > 5) {
         //TODO: put some validation here
         myDetails.status = this.status;
       }
       if (this.name != null && this.name.isNotEmpty && this.name.length > 5) {
         //TODO: put some validation here
         myDetails.userName = this.name;
       }
       //the box has it as null .. due to my ignorance
       if (myDetails.status == null){
         myDetails.status="";
       }
       var request = User()
         ..firstName = myDetails.firstName
         ..userName=myDetails.userName
         ..status = myDetails.status
         ..userId = myDetails.userID
         ..mobileNo = myDetails.mobileNo;

       var resp = await userStub.update(request);
       print(resp);
       print(resp.err);
       print(resp.message);
       if (resp.err != Error()){//TODO:this can be a costly check
         print("error while updating details");
         print(resp.err);
         throw resp.err;
       }
       print(resp.message);
       print("updating user details");
       MyDetailsBoxHandler.updateMyDetails(myDetails);
       print("user details updated");
     }catch(er){
       //TODO: handle it in better way
       print(er);
       throw er;
     }
  }
}