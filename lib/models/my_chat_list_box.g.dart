// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_chat_list_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MyChatListBoxModelAdapter extends TypeAdapter<MyChatListBoxModel> {
  @override
  final int typeId = 4;

  @override
  MyChatListBoxModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MyChatListBoxModel(
      chatId: fields[0] as String,
      lastMessage: fields[1] as String,
      unReadCount: fields[2] as int,
      lastOpenedTimeStamp: fields[3] as String,
      isGroup: fields[4] as bool,
      toUserId: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MyChatListBoxModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.chatId)
      ..writeByte(1)
      ..write(obj.lastMessage)
      ..writeByte(2)
      ..write(obj.unReadCount)
      ..writeByte(3)
      ..write(obj.lastOpenedTimeStamp)
      ..writeByte(4)
      ..write(obj.isGroup)
      ..writeByte(5)
      ..write(obj.toUserId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyChatListBoxModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
