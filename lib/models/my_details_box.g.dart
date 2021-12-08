// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_details_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyDetailsBoxModelAdapter extends TypeAdapter<MyDetailsBoxModel> {
  @override
  final int typeId = 2;

  @override
  MyDetailsBoxModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyDetailsBoxModel(
      userName: fields[0] as String,
      status: fields[1] as String,
      mobileNo: fields[2] as String,
      userID: fields[3] as String,
      firstName: fields[5] as String,
    )..profilePic = fields[4] as String;
  }

  @override
  void write(BinaryWriter writer, MyDetailsBoxModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.mobileNo)
      ..writeByte(3)
      ..write(obj.userID)
      ..writeByte(4)
      ..write(obj.profilePic)
      ..writeByte(5)
      ..write(obj.firstName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyDetailsBoxModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
