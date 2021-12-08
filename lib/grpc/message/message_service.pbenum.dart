///
//  Generated code. Do not modify.
//  source: message/message_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class UserChatMessage_notification_type extends $pb.ProtobufEnum {
  static const UserChatMessage_notification_type MESSAGE = UserChatMessage_notification_type._(0, 'MESSAGE');
  static const UserChatMessage_notification_type IMAGE = UserChatMessage_notification_type._(1, 'IMAGE');
  static const UserChatMessage_notification_type FILE = UserChatMessage_notification_type._(2, 'FILE');
  static const UserChatMessage_notification_type WEBRTCEVENT = UserChatMessage_notification_type._(3, 'WEBRTCEVENT');

  static const $core.List<UserChatMessage_notification_type> values = <UserChatMessage_notification_type> [
    MESSAGE,
    IMAGE,
    FILE,
    WEBRTCEVENT,
  ];

  static final $core.Map<$core.int, UserChatMessage_notification_type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UserChatMessage_notification_type valueOf($core.int value) => _byValue[value];

  const UserChatMessage_notification_type._($core.int v, $core.String n) : super(v, n);
}

