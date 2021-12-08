import 'dart:io' show Platform;
import 'package:device_info/device_info.dart';

class GetDeviceInfo {
  static String ANDROID = "android";
  static String IOS = 'ios';
  static String deviceType = "";
  static String DeviceId = "";
  static SetDevice() {
    if (Platform.isAndroid) {
      deviceType = ANDROID;
    } else if (Platform.isIOS) {
      deviceType = IOS;
    } else {
      deviceType = "ERROR";
    }
  }
  static SetDeviceId()async {
    final DeviceInfoPlugin DeviceInfo = DeviceInfoPlugin();
    if(deviceType == ANDROID){
      AndroidDeviceInfo androidDeviceInfo = await DeviceInfo.androidInfo;
      DeviceId = androidDeviceInfo.brand + androidDeviceInfo.model;
    }else if (deviceType == IOS){
      IosDeviceInfo iosDeviceInfo = await DeviceInfo.iosInfo;
      DeviceId = 'apple' + iosDeviceInfo.model;
    }
  }
}
