///
//  Generated code. Do not modify.
//  source: message/message_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'message_service.pb.dart' as $0;
import 'message_service.pbjson.dart';

export 'message_service.pb.dart';

abstract class MessageServiceBase extends $pb.GeneratedService {
  $async.Future<$0.UserChatMessage> connect($pb.ServerContext ctx, $0.UserById request);
  $async.Future<$0.MsgSent> broadCastMessage($pb.ServerContext ctx, $0.UserChatMessage request);
  $async.Future<$0.MsgSent> sendMessage($pb.ServerContext ctx, $0.UserChatMessage request);
  $async.Future<$0.StatusOkResponse> removeConnection($pb.ServerContext ctx, $0.UserById request);
  $async.Future<$0.StatusOkResponse> emitWebRTCevents($pb.ServerContext ctx, $0.emitWebRTCeventsRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'Connect': return $0.UserById();
      case 'BroadCastMessage': return $0.UserChatMessage();
      case 'SendMessage': return $0.UserChatMessage();
      case 'RemoveConnection': return $0.UserById();
      case 'emitWebRTCevents': return $0.emitWebRTCeventsRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'Connect': return this.connect(ctx, request);
      case 'BroadCastMessage': return this.broadCastMessage(ctx, request);
      case 'SendMessage': return this.sendMessage(ctx, request);
      case 'RemoveConnection': return this.removeConnection(ctx, request);
      case 'emitWebRTCevents': return this.emitWebRTCevents(ctx, request);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => MessageServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => MessageServiceBase$messageJson;
}

