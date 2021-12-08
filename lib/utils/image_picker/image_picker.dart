import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:iversion/consts/error_codes.dart';
import 'package:iversion/utils/error/exceptions.dart';

class ImagePickerUtils{
File image;
final picker = ImagePicker();
Future getImageFromGallery()async{
  try {
    await getImage(ImageSource.gallery);
    print(this.image.path);
    // follow image cropper flutter dev page for more info
    // only add activity config in main xml file ..
    //TODO: more work in this code, better error handling
    File croppedFile = await ImageCropper.cropImage(
        sourcePath: this.image.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          minimumAspectRatio: 1.0,
        )
    );
    if (croppedFile == null){
     throw FailureError(errorMessage: "Failed image editing",errorCode: ErrorCode.fileNotPicked);
    }
    print("printing cropped image path");
    print(croppedFile.path);
  }catch(er){
    print(er);
    print("error while loading image");
    throw er;
  }
}

Future getImage(ImageSource src)async{
  try{
   var pickedFile = await picker.getImage(source: src);
   if (pickedFile==null){
     print("No file choses");
     throw FailureError(errorMessage: "Image not picked",errorCode: ErrorCode.fileNotPicked);
   }else {
     this.image = File(pickedFile.path);
   }
   }catch(er){
    rethrow;
  }

}

}