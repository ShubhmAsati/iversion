import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
class PermissionService{
  final List<Permission> _permissionHandler = Permission.values;

  getPermission(){
    print("inside permission service");
   _permissionHandler.map((e){
     print(e.status);
     print(e.value);

   });
  }
  Future<void> checkServiceStatus(Permission permission) async {
    var permissionStatus = await permission.status;
    print(permissionStatus);
  }

  Future<bool> isPermissionGranted(Permission permission)async{
    var permissionStatus = await permission.status;
     if (permissionStatus.isGranted){
       return true;
     }
     return false;
  }
  //request for permission and return true or false if accepted or not
  Future<bool> askForPermission(Permission permission) async{
    try{
      var permissionStatus = await permission.status;
      if (permissionStatus.isGranted) {
        return true;
      }else{
        PermissionStatus p=await requestPermission(permission);
        return p.isGranted;   
      }
    }catch(er){
      print(er);
      throw er;
    }
  }

  Future<PermissionStatus> requestPermission(Permission permission) async {
    final status = await permission.request();
    return status;
  }
}