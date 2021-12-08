///
//  Generated code. Do not modify.
//  source: user/user_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'user_service.pb.dart' as $0;
export 'user_service.pb.dart';

class UserServiceClient extends $grpc.Client {
  static final _$add = $grpc.ClientMethod<$0.User, $0.AddUserResponse>(
      '/user_grpc.UserService/add',
      ($0.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AddUserResponse.fromBuffer(value));
  static final _$uploadProfilePic =
      $grpc.ClientMethod<$0.UploadProfilePicRequest, $0.StatusOkResponse>(
          '/user_grpc.UserService/uploadProfilePic',
          ($0.UploadProfilePicRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.StatusOkResponse.fromBuffer(value));
  static final _$loadMyMessages = $grpc.ClientMethod<$0.User, $0.MyMessages>(
      '/user_grpc.UserService/loadMyMessages',
      ($0.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.MyMessages.fromBuffer(value));
  static final _$getUserByUserId =
      $grpc.ClientMethod<$0.getUserByUserIdRequest, $0.User>(
          '/user_grpc.UserService/getUserByUserId',
          ($0.getUserByUserIdRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.User.fromBuffer(value));
  static final _$update = $grpc.ClientMethod<$0.User, $0.StatusOkResponse>(
      '/user_grpc.UserService/update',
      ($0.User value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.StatusOkResponse.fromBuffer(value));
  static final _$searchUsersByUserName = $grpc.ClientMethod<
          $0.getUserByUserNameRequest, $0.searchUsersByUserNameResponse>(
      '/user_grpc.UserService/searchUsersByUserName',
      ($0.getUserByUserNameRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.searchUsersByUserNameResponse.fromBuffer(value));
  static final _$getExistingUserNames = $grpc.ClientMethod<
          $0.getExistingUserNamesRequest, $0.getExistingUserNamesResponse>(
      '/user_grpc.UserService/getExistingUserNames',
      ($0.getExistingUserNamesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.getExistingUserNamesResponse.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.AddUserResponse> add($0.User request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$add, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.StatusOkResponse> uploadProfilePic(
      $0.UploadProfilePicRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$uploadProfilePic, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.MyMessages> loadMyMessages($0.User request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$loadMyMessages, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.User> getUserByUserId(
      $0.getUserByUserIdRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getUserByUserId, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.StatusOkResponse> update($0.User request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$update, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.searchUsersByUserNameResponse> searchUsersByUserName(
      $0.getUserByUserNameRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$searchUsersByUserName, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.getExistingUserNamesResponse> getExistingUserNames(
      $0.getExistingUserNamesRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getExistingUserNames, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'user_grpc.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.User, $0.AddUserResponse>(
        'add',
        add_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.User.fromBuffer(value),
        ($0.AddUserResponse value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.UploadProfilePicRequest, $0.StatusOkResponse>(
            'uploadProfilePic',
            uploadProfilePic_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.UploadProfilePicRequest.fromBuffer(value),
            ($0.StatusOkResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.User, $0.MyMessages>(
        'loadMyMessages',
        loadMyMessages_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.User.fromBuffer(value),
        ($0.MyMessages value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.getUserByUserIdRequest, $0.User>(
        'getUserByUserId',
        getUserByUserId_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.getUserByUserIdRequest.fromBuffer(value),
        ($0.User value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.User, $0.StatusOkResponse>(
        'update',
        update_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.User.fromBuffer(value),
        ($0.StatusOkResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.getUserByUserNameRequest,
            $0.searchUsersByUserNameResponse>(
        'searchUsersByUserName',
        searchUsersByUserName_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.getUserByUserNameRequest.fromBuffer(value),
        ($0.searchUsersByUserNameResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.getExistingUserNamesRequest,
            $0.getExistingUserNamesResponse>(
        'getExistingUserNames',
        getExistingUserNames_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.getExistingUserNamesRequest.fromBuffer(value),
        ($0.getExistingUserNamesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.AddUserResponse> add_Pre(
      $grpc.ServiceCall call, $async.Future<$0.User> request) async {
    return add(call, await request);
  }

  $async.Future<$0.StatusOkResponse> uploadProfilePic_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.UploadProfilePicRequest> request) async {
    return uploadProfilePic(call, await request);
  }

  $async.Future<$0.MyMessages> loadMyMessages_Pre(
      $grpc.ServiceCall call, $async.Future<$0.User> request) async {
    return loadMyMessages(call, await request);
  }

  $async.Future<$0.User> getUserByUserId_Pre($grpc.ServiceCall call,
      $async.Future<$0.getUserByUserIdRequest> request) async {
    return getUserByUserId(call, await request);
  }

  $async.Future<$0.StatusOkResponse> update_Pre(
      $grpc.ServiceCall call, $async.Future<$0.User> request) async {
    return update(call, await request);
  }

  $async.Future<$0.searchUsersByUserNameResponse> searchUsersByUserName_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.getUserByUserNameRequest> request) async {
    return searchUsersByUserName(call, await request);
  }

  $async.Future<$0.getExistingUserNamesResponse> getExistingUserNames_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.getExistingUserNamesRequest> request) async {
    return getExistingUserNames(call, await request);
  }

  $async.Future<$0.AddUserResponse> add(
      $grpc.ServiceCall call, $0.User request);
  $async.Future<$0.StatusOkResponse> uploadProfilePic(
      $grpc.ServiceCall call, $0.UploadProfilePicRequest request);
  $async.Future<$0.MyMessages> loadMyMessages(
      $grpc.ServiceCall call, $0.User request);
  $async.Future<$0.User> getUserByUserId(
      $grpc.ServiceCall call, $0.getUserByUserIdRequest request);
  $async.Future<$0.StatusOkResponse> update(
      $grpc.ServiceCall call, $0.User request);
  $async.Future<$0.searchUsersByUserNameResponse> searchUsersByUserName(
      $grpc.ServiceCall call, $0.getUserByUserNameRequest request);
  $async.Future<$0.getExistingUserNamesResponse> getExistingUserNames(
      $grpc.ServiceCall call, $0.getExistingUserNamesRequest request);
}
