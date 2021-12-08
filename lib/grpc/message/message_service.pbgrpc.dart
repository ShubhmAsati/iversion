///
//  Generated code. Do not modify.
//  source: message/message_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'message_service.pb.dart' as $0;
export 'message_service.pb.dart';

class MessageClient extends $grpc.Client {
  static final _$connect = $grpc.ClientMethod<$0.UserById, $0.UserChatMessage>(
      '/message_grpc.Message/Connect',
      ($0.UserById value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserChatMessage.fromBuffer(value));
  static final _$broadCastMessage =
      $grpc.ClientMethod<$0.UserChatMessage, $0.MsgSent>(
          '/message_grpc.Message/BroadCastMessage',
          ($0.UserChatMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.MsgSent.fromBuffer(value));
  static final _$sendMessage =
      $grpc.ClientMethod<$0.UserChatMessage, $0.MsgSent>(
          '/message_grpc.Message/SendMessage',
          ($0.UserChatMessage value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.MsgSent.fromBuffer(value));
  static final _$removeConnection =
      $grpc.ClientMethod<$0.UserById, $0.StatusOkResponse>(
          '/message_grpc.Message/RemoveConnection',
          ($0.UserById value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.StatusOkResponse.fromBuffer(value));
  static final _$emitWebRTCevents =
      $grpc.ClientMethod<$0.emitWebRTCeventsRequest, $0.StatusOkResponse>(
          '/message_grpc.Message/emitWebRTCevents',
          ($0.emitWebRTCeventsRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.StatusOkResponse.fromBuffer(value));

  MessageClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseStream<$0.UserChatMessage> connect($0.UserById request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$connect, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseFuture<$0.MsgSent> broadCastMessage($0.UserChatMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$broadCastMessage, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.MsgSent> sendMessage($0.UserChatMessage request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$sendMessage, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.StatusOkResponse> removeConnection(
      $0.UserById request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$removeConnection, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.StatusOkResponse> emitWebRTCevents(
      $0.emitWebRTCeventsRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$emitWebRTCevents, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class MessageServiceBase extends $grpc.Service {
  $core.String get $name => 'message_grpc.Message';

  MessageServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.UserById, $0.UserChatMessage>(
        'Connect',
        connect_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.UserById.fromBuffer(value),
        ($0.UserChatMessage value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserChatMessage, $0.MsgSent>(
        'BroadCastMessage',
        broadCastMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserChatMessage.fromBuffer(value),
        ($0.MsgSent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserChatMessage, $0.MsgSent>(
        'SendMessage',
        sendMessage_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserChatMessage.fromBuffer(value),
        ($0.MsgSent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UserById, $0.StatusOkResponse>(
        'RemoveConnection',
        removeConnection_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserById.fromBuffer(value),
        ($0.StatusOkResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.emitWebRTCeventsRequest, $0.StatusOkResponse>(
            'emitWebRTCevents',
            emitWebRTCevents_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.emitWebRTCeventsRequest.fromBuffer(value),
            ($0.StatusOkResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.UserChatMessage> connect_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserById> request) async* {
    yield* connect(call, await request);
  }

  $async.Future<$0.MsgSent> broadCastMessage_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserChatMessage> request) async {
    return broadCastMessage(call, await request);
  }

  $async.Future<$0.MsgSent> sendMessage_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserChatMessage> request) async {
    return sendMessage(call, await request);
  }

  $async.Future<$0.StatusOkResponse> removeConnection_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserById> request) async {
    return removeConnection(call, await request);
  }

  $async.Future<$0.StatusOkResponse> emitWebRTCevents_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.emitWebRTCeventsRequest> request) async {
    return emitWebRTCevents(call, await request);
  }

  $async.Stream<$0.UserChatMessage> connect(
      $grpc.ServiceCall call, $0.UserById request);
  $async.Future<$0.MsgSent> broadCastMessage(
      $grpc.ServiceCall call, $0.UserChatMessage request);
  $async.Future<$0.MsgSent> sendMessage(
      $grpc.ServiceCall call, $0.UserChatMessage request);
  $async.Future<$0.StatusOkResponse> removeConnection(
      $grpc.ServiceCall call, $0.UserById request);
  $async.Future<$0.StatusOkResponse> emitWebRTCevents(
      $grpc.ServiceCall call, $0.emitWebRTCeventsRequest request);
}
