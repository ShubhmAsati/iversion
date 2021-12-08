// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_contacts_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyContactsBoxModelAdapter extends TypeAdapter<MyContactsBoxModel> {
  @override
  final int typeId = 3;

  @override
  MyContactsBoxModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyContactsBoxModel(
      firstName: fields[0] as String,
      status: fields[1] as String,
      mobileNo: fields[2] as String,
      userId: fields[3] as String,
      lastActiveTime: fields[6] as String,
      profilePic: fields[4] as String,
      userName: fields[7] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MyContactsBoxModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(7)
      ..write(obj.userName)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.mobileNo)
      ..writeByte(3)
      ..write(obj.userId)
      ..writeByte(4)
      ..write(obj.profilePic)
      ..writeByte(6)
      ..write(obj.lastActiveTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyContactsBoxModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
