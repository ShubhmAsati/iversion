import 'package:grpc/grpc.dart';

class GrpcClientChannel {
  static ClientChannel clientChannel;
  static final serverHost = "35.192.72.171";
  static final port = 80;
  static bool isAnyCallRecentlyFailed = false;
  static setupChannel() {
    //TODO: set timing constraints to connect to server
    clientChannel = ClientChannel(
      serverHost,
      port: port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  }

  static resetChannel() {
    if (clientChannel != null) {
      clientChannel.terminate();
    }
    clientChannel = ClientChannel(
      serverHost,
      port: port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
  }

  static ClientChannel getChannel() {
    try {
      if (clientChannel == null) {
        print("setting up channel for the first time");
        setupChannel();
      }
    } catch (onError) {
      print("error while connecting to server" + onError.toString());
      throw onError;
    }
    return clientChannel;
  }
}
