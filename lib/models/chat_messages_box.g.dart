// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_messages_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChatMessagesBoxModelAdapter extends TypeAdapter<ChatMessagesBoxModel> {
  @override
  final int typeId = 1;

  @override
  ChatMessagesBoxModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatMessagesBoxModel(
      fromUserId: fields[0] as String,
      toUserId: fields[1] as String,
      message: fields[2] as String,
      sentTimeStamp: fields[3] as String,
      receivedTimeStamp: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ChatMessagesBoxModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.fromUserId)
      ..writeByte(1)
      ..write(obj.toUserId)
      ..writeByte(2)
      ..write(obj.message)
      ..writeByte(3)
      ..write(obj.sentTimeStamp)
      ..writeByte(4)
      ..write(obj.receivedTimeStamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatMessagesBoxModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
