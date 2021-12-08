///
//  Generated code. Do not modify.
//  source: message/message_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const UserById$json = const {
  '1': 'UserById',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

const Msg$json = const {
  '1': 'Msg',
  '2': const [
    const {'1': 'msgId', '3': 1, '4': 1, '5': 9, '10': 'msgId'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'UtcTimestamp', '3': 3, '4': 1, '5': 9, '10': 'UtcTimestamp'},
  ],
};

const UserChatMessage$json = const {
  '1': 'UserChatMessage',
  '2': const [
    const {'1': 'nt', '3': 1, '4': 1, '5': 14, '6': '.message_grpc.UserChatMessage.notification_type', '10': 'nt'},
    const {'1': 'isGroup', '3': 2, '4': 1, '5': 8, '10': 'isGroup'},
    const {'1': 'fromUserId', '3': 3, '4': 1, '5': 9, '10': 'fromUserId'},
    const {'1': 'toUserId', '3': 4, '4': 1, '5': 9, '10': 'toUserId'},
    const {'1': 'msg', '3': 6, '4': 1, '5': 11, '6': '.message_grpc.Msg', '10': 'msg'},
    const {'1': 'chatId', '3': 7, '4': 1, '5': 9, '10': 'chatId'},
    const {'1': 'sentUtcTimeStamp', '3': 8, '4': 1, '5': 9, '10': 'sentUtcTimeStamp'},
    const {'1': 'recivedUtdTimeStamp', '3': 9, '4': 1, '5': 9, '10': 'recivedUtdTimeStamp'},
    const {'1': 'iceCandidate', '3': 10, '4': 1, '5': 9, '10': 'iceCandidate'},
    const {'1': 'dynamicJSONString', '3': 11, '4': 1, '5': 9, '10': 'dynamicJSONString'},
    const {'1': 'webRTCEventType', '3': 12, '4': 1, '5': 9, '10': 'webRTCEventType'},
  ],
  '4': const [UserChatMessage_notification_type$json],
};

const UserChatMessage_notification_type$json = const {
  '1': 'notification_type',
  '2': const [
    const {'1': 'MESSAGE', '2': 0},
    const {'1': 'IMAGE', '2': 1},
    const {'1': 'FILE', '2': 2},
    const {'1': 'WEBRTCEVENT', '2': 3},
  ],
};

const MsgSent$json = const {
  '1': 'MsgSent',
  '2': const [
    const {'1': 'isSent', '3': 1, '4': 1, '5': 8, '10': 'isSent'},
    const {'1': 'sentUtcTimeStamp', '3': 2, '4': 1, '5': 9, '10': 'sentUtcTimeStamp'},
  ],
};

const StatusOkResponse$json = const {
  '1': 'StatusOkResponse',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'successCode', '3': 2, '4': 1, '5': 5, '10': 'successCode'},
    const {'1': 'err', '3': 3, '4': 1, '5': 11, '6': '.message_grpc.Error', '10': 'err'},
  ],
};

const Error$json = const {
  '1': 'Error',
  '2': const [
    const {'1': 'errorMsg', '3': 1, '4': 1, '5': 9, '10': 'errorMsg'},
    const {'1': 'errorCode', '3': 2, '4': 1, '5': 5, '10': 'errorCode'},
    const {'1': 'errorDetails', '3': 3, '4': 1, '5': 9, '10': 'errorDetails'},
  ],
};

const emitWebRTCeventsRequest$json = const {
  '1': 'emitWebRTCeventsRequest',
  '2': const [
    const {'1': 'fromUserId', '3': 1, '4': 1, '5': 9, '10': 'fromUserId'},
    const {'1': 'toUserId', '3': 2, '4': 1, '5': 9, '10': 'toUserId'},
    const {'1': 'ICECandidate', '3': 3, '4': 1, '5': 9, '10': 'ICECandidate'},
    const {'1': 'eventType', '3': 4, '4': 1, '5': 9, '10': 'eventType'},
    const {'1': 'dynamicPayload', '3': 5, '4': 1, '5': 9, '10': 'dynamicPayload'},
  ],
};

const MessageServiceBase$json = const {
  '1': 'Message',
  '2': const [
    const {'1': 'Connect', '2': '.message_grpc.UserById', '3': '.message_grpc.UserChatMessage', '6': true},
    const {'1': 'BroadCastMessage', '2': '.message_grpc.UserChatMessage', '3': '.message_grpc.MsgSent'},
    const {'1': 'SendMessage', '2': '.message_grpc.UserChatMessage', '3': '.message_grpc.MsgSent'},
    const {'1': 'RemoveConnection', '2': '.message_grpc.UserById', '3': '.message_grpc.StatusOkResponse'},
    const {'1': 'emitWebRTCevents', '2': '.message_grpc.emitWebRTCeventsRequest', '3': '.message_grpc.StatusOkResponse'},
  ],
};

const MessageServiceBase$messageJson = const {
  '.message_grpc.UserById': UserById$json,
  '.message_grpc.UserChatMessage': UserChatMessage$json,
  '.message_grpc.Msg': Msg$json,
  '.message_grpc.MsgSent': MsgSent$json,
  '.message_grpc.StatusOkResponse': StatusOkResponse$json,
  '.message_grpc.Error': Error$json,
  '.message_grpc.emitWebRTCeventsRequest': emitWebRTCeventsRequest$json,
};

