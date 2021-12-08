///
//  Generated code. Do not modify.
//  source: user/user_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'user_service.pb.dart' as $0;
import 'user_service.pbjson.dart';

export 'user_service.pb.dart';

abstract class UserServiceBase extends $pb.GeneratedService {
  $async.Future<$0.AddUserResponse> add($pb.ServerContext ctx, $0.User request);
  $async.Future<$0.StatusOkResponse> uploadProfilePic($pb.ServerContext ctx, $0.UploadProfilePicRequest request);
  $async.Future<$0.MyMessages> loadMyMessages($pb.ServerContext ctx, $0.User request);
  $async.Future<$0.User> getUserByUserId($pb.ServerContext ctx, $0.getUserByUserIdRequest request);
  $async.Future<$0.StatusOkResponse> update($pb.ServerContext ctx, $0.User request);
  $async.Future<$0.searchUsersByUserNameResponse> searchUsersByUserName($pb.ServerContext ctx, $0.getUserByUserNameRequest request);
  $async.Future<$0.getExistingUserNamesResponse> getExistingUserNames($pb.ServerContext ctx, $0.getExistingUserNamesRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'add': return $0.User();
      case 'uploadProfilePic': return $0.UploadProfilePicRequest();
      case 'loadMyMessages': return $0.User();
      case 'getUserByUserId': return $0.getUserByUserIdRequest();
      case 'update': return $0.User();
      case 'searchUsersByUserName': return $0.getUserByUserNameRequest();
      case 'getExistingUserNames': return $0.getExistingUserNamesRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'add': return this.add(ctx, request);
      case 'uploadProfilePic': return this.uploadProfilePic(ctx, request);
      case 'loadMyMessages': return this.loadMyMessages(ctx, request);
      case 'getUserByUserId': return this.getUserByUserId(ctx, request);
      case 'update': return this.update(ctx, request);
      case 'searchUsersByUserName': return this.searchUsersByUserName(ctx, request);
      case 'getExistingUserNames': return this.getExistingUserNames(ctx, request);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => UserServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => UserServiceBase$messageJson;
}

