import 'package:connectivity/connectivity.dart';
import 'package:iversion/background_tasks/user_chat_messages_runner.dart';
import 'package:iversion/utils/grpc_channel/grpc_channel.dart';

class InternetConnectivity {
  static final Connectivity _connectivity = Connectivity();
//this variable can be referred to know if mobile is connected to internet or not
  static bool isConnected = false;

  static setupConnectivityStream() {
    _connectivity.onConnectivityChanged.listen((event) {
      print("inside setupConnectivity");
      print(event);
      if (event == ConnectivityResult.none) {
        isConnected = false;
      } else {
        print("connected to internet");
        //reset the channel connection if any call fails
        // referring to stack overflow https://stackoverflow.com/questions/54105481/grpc-in-flutter-crash-when-no-internet
        isConnected = true;
        if (GrpcClientChannel.isAnyCallRecentlyFailed) {
          GrpcClientChannel.resetChannel();
        }
        //reset the message streaming
        print("restarting message streaming");
        if (UserChatMessagesRunner.isMessageStreamingStarted) {
          UserChatMessagesRunner.cleanupAndRestartMessageStream();
        }
      }
    });
  }
}
