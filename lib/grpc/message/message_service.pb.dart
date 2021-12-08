///
//  Generated code. Do not modify.
//  source: message/message_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'message_service.pbenum.dart';

export 'message_service.pbenum.dart';

class UserById extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserById', package: const $pb.PackageName('message_grpc'), createEmptyInstance: create)
    ..aOS(1, 'userId', protoName: 'userId')
    ..hasRequiredFields = false
  ;

  UserById._() : super();
  factory UserById() => create();
  factory UserById.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserById.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserById clone() => UserById()..mergeFromMessage(this);
  UserById copyWith(void Function(UserById) updates) => super.copyWith((message) => updates(message as UserById));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserById create() => UserById._();
  UserById createEmptyInstance() => create();
  static $pb.PbList<UserById> createRepeated() => $pb.PbList<UserById>();
  @$core.pragma('dart2js:noInline')
  static UserById getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserById>(create);
  static UserById _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class Msg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Msg', package: const $pb.PackageName('message_grpc'), createEmptyInstance: create)
    ..aOS(1, 'msgId', protoName: 'msgId')
    ..aOS(2, 'message')
    ..aOS(3, 'UtcTimestamp', protoName: 'UtcTimestamp')
    ..hasRequiredFields = false
  ;

  Msg._() : super();
  factory Msg() => create();
  factory Msg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Msg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Msg clone() => Msg()..mergeFromMessage(this);
  Msg copyWith(void Function(Msg) updates) => super.copyWith((message) => updates(message as Msg));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Msg create() => Msg._();
  Msg createEmptyInstance() => create();
  static $pb.PbList<Msg> createRepeated() => $pb.PbList<Msg>();
  @$core.pragma('dart2js:noInline')
  static Msg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Msg>(create);
  static Msg _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get msgId => $_getSZ(0);
  @$pb.TagNumber(1)
  set msgId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMsgId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsgId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get utcTimestamp => $_getSZ(2);
  @$pb.TagNumber(3)
  set utcTimestamp($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUtcTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearUtcTimestamp() => clearField(3);
}

class UserChatMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserChatMessage', package: const $pb.PackageName('message_grpc'), createEmptyInstance: create)
    ..e<UserChatMessage_notification_type>(1, 'nt', $pb.PbFieldType.OE, defaultOrMaker: UserChatMessage_notification_type.MESSAGE, valueOf: UserChatMessage_notification_type.valueOf, enumValues: UserChatMessage_notification_type.values)
    ..aOB(2, 'isGroup', protoName: 'isGroup')
    ..aOS(3, 'fromUserId', protoName: 'fromUserId')
    ..aOS(4, 'toUserId', protoName: 'toUserId')
    ..aOM<Msg>(6, 'msg', subBuilder: Msg.create)
    ..aOS(7, 'chatId', protoName: 'chatId')
    ..aOS(8, 'sentUtcTimeStamp', protoName: 'sentUtcTimeStamp')
    ..aOS(9, 'recivedUtdTimeStamp', protoName: 'recivedUtdTimeStamp')
    ..aOS(10, 'iceCandidate', protoName: 'iceCandidate')
    ..aOS(11, 'dynamicJSONString', protoName: 'dynamicJSONString')
    ..aOS(12, 'webRTCEventType', protoName: 'webRTCEventType')
    ..hasRequiredFields = false
  ;

  UserChatMessage._() : super();
  factory UserChatMessage() => create();
  factory UserChatMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserChatMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserChatMessage clone() => UserChatMessage()..mergeFromMessage(this);
  UserChatMessage copyWith(void Function(UserChatMessage) updates) => super.copyWith((message) => updates(message as UserChatMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserChatMessage create() => UserChatMessage._();
  UserChatMessage createEmptyInstance() => create();
  static $pb.PbList<UserChatMessage> createRepeated() => $pb.PbList<UserChatMessage>();
  @$core.pragma('dart2js:noInline')
  static UserChatMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserChatMessage>(create);
  static UserChatMessage _defaultInstance;

  @$pb.TagNumber(1)
  UserChatMessage_notification_type get nt => $_getN(0);
  @$pb.TagNumber(1)
  set nt(UserChatMessage_notification_type v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasNt() => $_has(0);
  @$pb.TagNumber(1)
  void clearNt() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get isGroup => $_getBF(1);
  @$pb.TagNumber(2)
  set isGroup($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIsGroup() => $_has(1);
  @$pb.TagNumber(2)
  void clearIsGroup() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get fromUserId => $_getSZ(2);
  @$pb.TagNumber(3)
  set fromUserId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFromUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFromUserId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get toUserId => $_getSZ(3);
  @$pb.TagNumber(4)
  set toUserId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasToUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearToUserId() => clearField(4);

  @$pb.TagNumber(6)
  Msg get msg => $_getN(4);
  @$pb.TagNumber(6)
  set msg(Msg v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasMsg() => $_has(4);
  @$pb.TagNumber(6)
  void clearMsg() => clearField(6);
  @$pb.TagNumber(6)
  Msg ensureMsg() => $_ensure(4);

  @$pb.TagNumber(7)
  $core.String get chatId => $_getSZ(5);
  @$pb.TagNumber(7)
  set chatId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasChatId() => $_has(5);
  @$pb.TagNumber(7)
  void clearChatId() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get sentUtcTimeStamp => $_getSZ(6);
  @$pb.TagNumber(8)
  set sentUtcTimeStamp($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasSentUtcTimeStamp() => $_has(6);
  @$pb.TagNumber(8)
  void clearSentUtcTimeStamp() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get recivedUtdTimeStamp => $_getSZ(7);
  @$pb.TagNumber(9)
  set recivedUtdTimeStamp($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasRecivedUtdTimeStamp() => $_has(7);
  @$pb.TagNumber(9)
  void clearRecivedUtdTimeStamp() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get iceCandidate => $_getSZ(8);
  @$pb.TagNumber(10)
  set iceCandidate($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasIceCandidate() => $_has(8);
  @$pb.TagNumber(10)
  void clearIceCandidate() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get dynamicJSONString => $_getSZ(9);
  @$pb.TagNumber(11)
  set dynamicJSONString($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasDynamicJSONString() => $_has(9);
  @$pb.TagNumber(11)
  void clearDynamicJSONString() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get webRTCEventType => $_getSZ(10);
  @$pb.TagNumber(12)
  set webRTCEventType($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(12)
  $core.bool hasWebRTCEventType() => $_has(10);
  @$pb.TagNumber(12)
  void clearWebRTCEventType() => clearField(12);
}

class MsgSent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MsgSent', package: const $pb.PackageName('message_grpc'), createEmptyInstance: create)
    ..aOB(1, 'isSent', protoName: 'isSent')
    ..aOS(2, 'sentUtcTimeStamp', protoName: 'sentUtcTimeStamp')
    ..hasRequiredFields = false
  ;

  MsgSent._() : super();
  factory MsgSent() => create();
  factory MsgSent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MsgSent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  MsgSent clone() => MsgSent()..mergeFromMessage(this);
  MsgSent copyWith(void Function(MsgSent) updates) => super.copyWith((message) => updates(message as MsgSent));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MsgSent create() => MsgSent._();
  MsgSent createEmptyInstance() => create();
  static $pb.PbList<MsgSent> createRepeated() => $pb.PbList<MsgSent>();
  @$core.pragma('dart2js:noInline')
  static MsgSent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MsgSent>(create);
  static MsgSent _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isSent => $_getBF(0);
  @$pb.TagNumber(1)
  set isSent($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsSent() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsSent() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sentUtcTimeStamp => $_getSZ(1);
  @$pb.TagNumber(2)
  set sentUtcTimeStamp($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSentUtcTimeStamp() => $_has(1);
  @$pb.TagNumber(2)
  void clearSentUtcTimeStamp() => clearField(2);
}

class StatusOkResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('StatusOkResponse', package: const $pb.PackageName('message_grpc'), createEmptyInstance: create)
    ..aOS(1, 'message')
    ..a<$core.int>(2, 'successCode', $pb.PbFieldType.O3, protoName: 'successCode')
    ..aOM<Error>(3, 'err', subBuilder: Error.create)
    ..hasRequiredFields = false
  ;

  StatusOkResponse._() : super();
  factory StatusOkResponse() => create();
  factory StatusOkResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StatusOkResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  StatusOkResponse clone() => StatusOkResponse()..mergeFromMessage(this);
  StatusOkResponse copyWith(void Function(StatusOkResponse) updates) => super.copyWith((message) => updates(message as StatusOkResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StatusOkResponse create() => StatusOkResponse._();
  StatusOkResponse createEmptyInstance() => create();
  static $pb.PbList<StatusOkResponse> createRepeated() => $pb.PbList<StatusOkResponse>();
  @$core.pragma('dart2js:noInline')
  static StatusOkResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StatusOkResponse>(create);
  static StatusOkResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get successCode => $_getIZ(1);
  @$pb.TagNumber(2)
  set successCode($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccessCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccessCode() => clearField(2);

  @$pb.TagNumber(3)
  Error get err => $_getN(2);
  @$pb.TagNumber(3)
  set err(Error v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasErr() => $_has(2);
  @$pb.TagNumber(3)
  void clearErr() => clearField(3);
  @$pb.TagNumber(3)
  Error ensureErr() => $_ensure(2);
}

class Error extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Error', package: const $pb.PackageName('message_grpc'), createEmptyInstance: create)
    ..aOS(1, 'errorMsg', protoName: 'errorMsg')
    ..a<$core.int>(2, 'errorCode', $pb.PbFieldType.O3, protoName: 'errorCode')
    ..aOS(3, 'errorDetails', protoName: 'errorDetails')
    ..hasRequiredFields = false
  ;

  Error._() : super();
  factory Error() => create();
  factory Error.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Error.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Error clone() => Error()..mergeFromMessage(this);
  Error copyWith(void Function(Error) updates) => super.copyWith((message) => updates(message as Error));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Error create() => Error._();
  Error createEmptyInstance() => create();
  static $pb.PbList<Error> createRepeated() => $pb.PbList<Error>();
  @$core.pragma('dart2js:noInline')
  static Error getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Error>(create);
  static Error _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get errorMsg => $_getSZ(0);
  @$pb.TagNumber(1)
  set errorMsg($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasErrorMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearErrorMsg() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get errorCode => $_getIZ(1);
  @$pb.TagNumber(2)
  set errorCode($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasErrorCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearErrorCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get errorDetails => $_getSZ(2);
  @$pb.TagNumber(3)
  set errorDetails($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasErrorDetails() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorDetails() => clearField(3);
}

class emitWebRTCeventsRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('emitWebRTCeventsRequest', package: const $pb.PackageName('message_grpc'), createEmptyInstance: create)
    ..aOS(1, 'fromUserId', protoName: 'fromUserId')
    ..aOS(2, 'toUserId', protoName: 'toUserId')
    ..aOS(3, 'ICECandidate', protoName: 'ICECandidate')
    ..aOS(4, 'eventType', protoName: 'eventType')
    ..aOS(5, 'dynamicPayload', protoName: 'dynamicPayload')
    ..hasRequiredFields = false
  ;

  emitWebRTCeventsRequest._() : super();
  factory emitWebRTCeventsRequest() => create();
  factory emitWebRTCeventsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory emitWebRTCeventsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  emitWebRTCeventsRequest clone() => emitWebRTCeventsRequest()..mergeFromMessage(this);
  emitWebRTCeventsRequest copyWith(void Function(emitWebRTCeventsRequest) updates) => super.copyWith((message) => updates(message as emitWebRTCeventsRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static emitWebRTCeventsRequest create() => emitWebRTCeventsRequest._();
  emitWebRTCeventsRequest createEmptyInstance() => create();
  static $pb.PbList<emitWebRTCeventsRequest> createRepeated() => $pb.PbList<emitWebRTCeventsRequest>();
  @$core.pragma('dart2js:noInline')
  static emitWebRTCeventsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<emitWebRTCeventsRequest>(create);
  static emitWebRTCeventsRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fromUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set fromUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFromUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get toUserId => $_getSZ(1);
  @$pb.TagNumber(2)
  set toUserId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasToUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearToUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get iCECandidate => $_getSZ(2);
  @$pb.TagNumber(3)
  set iCECandidate($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasICECandidate() => $_has(2);
  @$pb.TagNumber(3)
  void clearICECandidate() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get eventType => $_getSZ(3);
  @$pb.TagNumber(4)
  set eventType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasEventType() => $_has(3);
  @$pb.TagNumber(4)
  void clearEventType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get dynamicPayload => $_getSZ(4);
  @$pb.TagNumber(5)
  set dynamicPayload($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDynamicPayload() => $_has(4);
  @$pb.TagNumber(5)
  void clearDynamicPayload() => clearField(5);
}

class MessageApi {
  $pb.RpcClient _client;
  MessageApi(this._client);

  $async.Future<UserChatMessage> connect($pb.ClientContext ctx, UserById request) {
    var emptyResponse = UserChatMessage();
    return _client.invoke<UserChatMessage>(ctx, 'Message', 'Connect', request, emptyResponse);
  }
  $async.Future<MsgSent> broadCastMessage($pb.ClientContext ctx, UserChatMessage request) {
    var emptyResponse = MsgSent();
    return _client.invoke<MsgSent>(ctx, 'Message', 'BroadCastMessage', request, emptyResponse);
  }
  $async.Future<MsgSent> sendMessage($pb.ClientContext ctx, UserChatMessage request) {
    var emptyResponse = MsgSent();
    return _client.invoke<MsgSent>(ctx, 'Message', 'SendMessage', request, emptyResponse);
  }
  $async.Future<StatusOkResponse> removeConnection($pb.ClientContext ctx, UserById request) {
    var emptyResponse = StatusOkResponse();
    return _client.invoke<StatusOkResponse>(ctx, 'Message', 'RemoveConnection', request, emptyResponse);
  }
  $async.Future<StatusOkResponse> emitWebRTCevents($pb.ClientContext ctx, emitWebRTCeventsRequest request) {
    var emptyResponse = StatusOkResponse();
    return _client.invoke<StatusOkResponse>(ctx, 'Message', 'emitWebRTCevents', request, emptyResponse);
  }
}

