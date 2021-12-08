///
//  Generated code. Do not modify.
//  source: user/user_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class User extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('User', package: const $pb.PackageName('user_grpc'), createEmptyInstance: create)
    ..aOS(1, 'firstName', protoName: 'firstName')
    ..aOS(2, 'userId', protoName: 'userId')
    ..aOS(3, 'profilePic', protoName: 'profilePic')
    ..aOS(4, 'mobileNo', protoName: 'mobileNo')
    ..aOS(5, 'status')
    ..aOS(6, 'userName', protoName: 'userName')
    ..hasRequiredFields = false
  ;

  User._() : super();
  factory User() => create();
  factory User.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory User.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  User clone() => User()..mergeFromMessage(this);
  User copyWith(void Function(User) updates) => super.copyWith((message) => updates(message as User));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firstName => $_getSZ(0);
  @$pb.TagNumber(1)
  set firstName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirstName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get profilePic => $_getSZ(2);
  @$pb.TagNumber(3)
  set profilePic($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasProfilePic() => $_has(2);
  @$pb.TagNumber(3)
  void clearProfilePic() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get mobileNo => $_getSZ(3);
  @$pb.TagNumber(4)
  set mobileNo($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMobileNo() => $_has(3);
  @$pb.TagNumber(4)
  void clearMobileNo() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get status => $_getSZ(4);
  @$pb.TagNumber(5)
  set status($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get userName => $_getSZ(5);
  @$pb.TagNumber(6)
  set userName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUserName() => $_has(5);
  @$pb.TagNumber(6)
  void clearUserName() => clearField(6);
}

class AddUserResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AddUserResponse', package: const $pb.PackageName('user_grpc'), createEmptyInstance: create)
    ..aOS(1, 'userId', protoName: 'userId')
    ..aOM<Error>(2, 'err', subBuilder: Error.create)
    ..hasRequiredFields = false
  ;

  AddUserResponse._() : super();
  factory AddUserResponse() => create();
  factory AddUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AddUserResponse clone() => AddUserResponse()..mergeFromMessage(this);
  AddUserResponse copyWith(void Function(AddUserResponse) updates) => super.copyWith((message) => updates(message as AddUserResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AddUserResponse create() => AddUserResponse._();
  AddUserResponse createEmptyInstance() => create();
  static $pb.PbList<AddUserResponse> createRepeated() => $pb.PbList<AddUserResponse>();
  @$core.pragma('dart2js:noInline')
  static AddUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddUserResponse>(create);
  static AddUserResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  @$pb.TagNumber(2)
  Error get err => $_getN(1);
  @$pb.TagNumber(2)
  set err(Error v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasErr() => $_has(1);
  @$pb.TagNumber(2)
  void clearErr() => clearField(2);
  @$pb.TagNumber(2)
  Error ensureErr() => $_ensure(1);
}

class UploadProfilePicRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UploadProfilePicRequest', package: const $pb.PackageName('user_grpc'), createEmptyInstance: create)
    ..aOS(1, 'profilePicPath', protoName: 'profilePicPath')
    ..aOM<User>(2, 'user', subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  UploadProfilePicRequest._() : super();
  factory UploadProfilePicRequest() => create();
  factory UploadProfilePicRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadProfilePicRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UploadProfilePicRequest clone() => UploadProfilePicRequest()..mergeFromMessage(this);
  UploadProfilePicRequest copyWith(void Function(UploadProfilePicRequest) updates) => super.copyWith((message) => updates(message as UploadProfilePicRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UploadProfilePicRequest create() => UploadProfilePicRequest._();
  UploadProfilePicRequest createEmptyInstance() => create();
  static $pb.PbList<UploadProfilePicRequest> createRepeated() => $pb.PbList<UploadProfilePicRequest>();
  @$core.pragma('dart2js:noInline')
  static UploadProfilePicRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadProfilePicRequest>(create);
  static UploadProfilePicRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get profilePicPath => $_getSZ(0);
  @$pb.TagNumber(1)
  set profilePicPath($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProfilePicPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearProfilePicPath() => clearField(1);

  @$pb.TagNumber(2)
  User get user => $_getN(1);
  @$pb.TagNumber(2)
  set user(User v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  User ensureUser() => $_ensure(1);
}

class MyMessages extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('MyMessages', package: const $pb.PackageName('user_grpc'), createEmptyInstance: create)
    ..pc<UserMsg>(1, 'userMsg', $pb.PbFieldType.PM, protoName: 'userMsg', subBuilder: UserMsg.create)
    ..aOM<Error>(2, 'error', subBuilder: Error.create)
    ..hasRequiredFields = false
  ;

  MyMessages._() : super();
  factory MyMessages() => create();
  factory MyMessages.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory MyMessages.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  MyMessages clone() => MyMessages()..mergeFromMessage(this);
  MyMessages copyWith(void Function(MyMessages) updates) => super.copyWith((message) => updates(message as MyMessages));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static MyMessages create() => MyMessages._();
  MyMessages createEmptyInstance() => create();
  static $pb.PbList<MyMessages> createRepeated() => $pb.PbList<MyMessages>();
  @$core.pragma('dart2js:noInline')
  static MyMessages getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<MyMessages>(create);
  static MyMessages _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<UserMsg> get userMsg => $_getList(0);

  @$pb.TagNumber(2)
  Error get error => $_getN(1);
  @$pb.TagNumber(2)
  set error(Error v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);
  @$pb.TagNumber(2)
  Error ensureError() => $_ensure(1);
}

class UserMsg extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserMsg', package: const $pb.PackageName('user_grpc'), createEmptyInstance: create)
    ..aOS(1, 'fromUserId', protoName: 'fromUserId')
    ..aOS(2, 'msg')
    ..hasRequiredFields = false
  ;

  UserMsg._() : super();
  factory UserMsg() => create();
  factory UserMsg.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserMsg.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserMsg clone() => UserMsg()..mergeFromMessage(this);
  UserMsg copyWith(void Function(UserMsg) updates) => super.copyWith((message) => updates(message as UserMsg));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserMsg create() => UserMsg._();
  UserMsg createEmptyInstance() => create();
  static $pb.PbList<UserMsg> createRepeated() => $pb.PbList<UserMsg>();
  @$core.pragma('dart2js:noInline')
  static UserMsg getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserMsg>(create);
  static UserMsg _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fromUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set fromUserId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFromUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromUserId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msg => $_getSZ(1);
  @$pb.TagNumber(2)
  set msg($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsg() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsg() => clearField(2);
}

class getUserByUserIdRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('getUserByUserIdRequest', package: const $pb.PackageName('user_grpc'), createEmptyInstance: create)
    ..aOS(1, 'userId', protoName: 'userId')
    ..hasRequiredFields = false
  ;

  getUserByUserIdRequest._() : super();
  factory getUserByUserIdRequest() => create();
  factory getUserByUserIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory getUserByUserIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  getUserByUserIdRequest clone() => getUserByUserIdRequest()..mergeFromMessage(this);
  getUserByUserIdRequest copyWith(void Function(getUserByUserIdRequest) updates) => super.copyWith((message) => updates(message as getUserByUserIdRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static getUserByUserIdRequest create() => getUserByUserIdRequest._();
  getUserByUserIdRequest createEmptyInstance() => create();
  static $pb.PbList<getUserByUserIdRequest> createRepeated() => $pb.PbList<getUserByUserIdRequest>();
  @$core.pragma('dart2js:noInline')
  static getUserByUserIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<getUserByUserIdRequest>(create);
  static getUserByUserIdRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);
}

class getUserByUserNameRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('getUserByUserNameRequest', package: const $pb.PackageName('user_grpc'), createEmptyInstance: create)
    ..aOS(1, 'userName', protoName: 'userName')
    ..hasRequiredFields = false
  ;

  getUserByUserNameRequest._() : super();
  factory getUserByUserNameRequest() => create();
  factory getUserByUserNameRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory getUserByUserNameRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  getUserByUserNameRequest clone() => getUserByUserNameRequest()..mergeFromMessage(this);
  getUserByUserNameRequest copyWith(void Function(getUserByUserNameRequest) updates) => super.copyWith((message) => updates(message as getUserByUserNameRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static getUserByUserNameRequest create() => getUserByUserNameRequest._();
  getUserByUserNameRequest createEmptyInstance() => create();
  static $pb.PbList<getUserByUserNameRequest> createRepeated() => $pb.PbList<getUserByUserNameRequest>();
  @$core.pragma('dart2js:noInline')
  static getUserByUserNameRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<getUserByUserNameRequest>(create);
  static getUserByUserNameRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userName => $_getSZ(0);
  @$pb.TagNumber(1)
  set userName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserName() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserName() => clearField(1);
}

class searchUsersByUserNameResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('searchUsersByUserNameResponse', package: const $pb.PackageName('user_grpc'), createEmptyInstance: create)
    ..pc<User>(1, 'user', $pb.PbFieldType.PM, subBuilder: User.create)
    ..hasRequiredFields = false
  ;

  searchUsersByUserNameResponse._() : super();
  factory searchUsersByUserNameResponse() => create();
  factory searchUsersByUserNameResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory searchUsersByUserNameResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  searchUsersByUserNameResponse clone() => searchUsersByUserNameResponse()..mergeFromMessage(this);
  searchUsersByUserNameResponse copyWith(void Function(searchUsersByUserNameResponse) updates) => super.copyWith((message) => updates(message as searchUsersByUserNameResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static searchUsersByUserNameResponse create() => searchUsersByUserNameResponse._();
  searchUsersByUserNameResponse createEmptyInstance() => create();
  static $pb.PbList<searchUsersByUserNameResponse> createRepeated() => $pb.PbList<searchUsersByUserNameResponse>();
  @$core.pragma('dart2js:noInline')
  static searchUsersByUserNameResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<searchUsersByUserNameResponse>(create);
  static searchUsersByUserNameResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<User> get user => $_getList(0);
}

class UserName extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UserName', package: const $pb.PackageName('user_grpc'), createEmptyInstance: create)
    ..aOS(1, 'userName', protoName: 'userName')
    ..hasRequiredFields = false
  ;

  UserName._() : super();
  factory UserName() => create();
  factory UserName.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserName.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UserName clone() => UserName()..mergeFromMessage(this);
  UserName copyWith(void Function(UserName) updates) => super.copyWith((message) => updates(message as UserName));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UserName create() => UserName._();
  UserName createEmptyInstance() => create();
  static $pb.PbList<UserName> createRepeated() => $pb.PbList<UserName>();
  @$core.pragma('dart2js:noInline')
  static UserName getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserName>(create);
  static UserName _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userName => $_getSZ(0);
  @$pb.TagNumber(1)
  set userName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserName() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserName() => clearField(1);
}

class getExistingUserNamesRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('getExistingUserNamesRequest', package: const $pb.PackageName('user_grpc'), createEmptyInstance: create)
    ..aOS(1, 'sample')
    ..hasRequiredFields = false
  ;

  getExistingUserNamesRequest._() : super();
  factory getExistingUserNamesRequest() => create();
  factory getExistingUserNamesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory getExistingUserNamesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  getExistingUserNamesRequest clone() => getExistingUserNamesRequest()..mergeFromMessage(this);
  getExistingUserNamesRequest copyWith(void Function(getExistingUserNamesRequest) updates) => super.copyWith((message) => updates(message as getExistingUserNamesRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static getExistingUserNamesRequest create() => getExistingUserNamesRequest._();
  getExistingUserNamesRequest createEmptyInstance() => create();
  static $pb.PbList<getExistingUserNamesRequest> createRepeated() => $pb.PbList<getExistingUserNamesRequest>();
  @$core.pragma('dart2js:noInline')
  static getExistingUserNamesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<getExistingUserNamesRequest>(create);
  static getExistingUserNamesRequest _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sample => $_getSZ(0);
  @$pb.TagNumber(1)
  set sample($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSample() => $_has(0);
  @$pb.TagNumber(1)
  void clearSample() => clearField(1);
}

class getExistingUserNamesResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('getExistingUserNamesResponse', package: const $pb.PackageName('user_grpc'), createEmptyInstance: create)
    ..pc<UserName>(1, 'userName', $pb.PbFieldType.PM, protoName: 'userName', subBuilder: UserName.create)
    ..hasRequiredFields = false
  ;

  getExistingUserNamesResponse._() : super();
  factory getExistingUserNamesResponse() => create();
  factory getExistingUserNamesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory getExistingUserNamesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  getExistingUserNamesResponse clone() => getExistingUserNamesResponse()..mergeFromMessage(this);
  getExistingUserNamesResponse copyWith(void Function(getExistingUserNamesResponse) updates) => super.copyWith((message) => updates(message as getExistingUserNamesResponse));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static getExistingUserNamesResponse create() => getExistingUserNamesResponse._();
  getExistingUserNamesResponse createEmptyInstance() => create();
  static $pb.PbList<getExistingUserNamesResponse> createRepeated() => $pb.PbList<getExistingUserNamesResponse>();
  @$core.pragma('dart2js:noInline')
  static getExistingUserNamesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<getExistingUserNamesResponse>(create);
  static getExistingUserNamesResponse _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<UserName> get userName => $_getList(0);
}

class StatusOkResponse extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('StatusOkResponse', package: const $pb.PackageName('user_grpc'), createEmptyInstance: create)
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Error', package: const $pb.PackageName('user_grpc'), createEmptyInstance: create)
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

class UserServiceApi {
  $pb.RpcClient _client;
  UserServiceApi(this._client);

  $async.Future<AddUserResponse> add($pb.ClientContext ctx, User request) {
    var emptyResponse = AddUserResponse();
    return _client.invoke<AddUserResponse>(ctx, 'UserService', 'add', request, emptyResponse);
  }
  $async.Future<StatusOkResponse> uploadProfilePic($pb.ClientContext ctx, UploadProfilePicRequest request) {
    var emptyResponse = StatusOkResponse();
    return _client.invoke<StatusOkResponse>(ctx, 'UserService', 'uploadProfilePic', request, emptyResponse);
  }
  $async.Future<MyMessages> loadMyMessages($pb.ClientContext ctx, User request) {
    var emptyResponse = MyMessages();
    return _client.invoke<MyMessages>(ctx, 'UserService', 'loadMyMessages', request, emptyResponse);
  }
  $async.Future<User> getUserByUserId($pb.ClientContext ctx, getUserByUserIdRequest request) {
    var emptyResponse = User();
    return _client.invoke<User>(ctx, 'UserService', 'getUserByUserId', request, emptyResponse);
  }
  $async.Future<StatusOkResponse> update($pb.ClientContext ctx, User request) {
    var emptyResponse = StatusOkResponse();
    return _client.invoke<StatusOkResponse>(ctx, 'UserService', 'update', request, emptyResponse);
  }
  $async.Future<searchUsersByUserNameResponse> searchUsersByUserName($pb.ClientContext ctx, getUserByUserNameRequest request) {
    var emptyResponse = searchUsersByUserNameResponse();
    return _client.invoke<searchUsersByUserNameResponse>(ctx, 'UserService', 'searchUsersByUserName', request, emptyResponse);
  }
  $async.Future<getExistingUserNamesResponse> getExistingUserNames($pb.ClientContext ctx, getExistingUserNamesRequest request) {
    var emptyResponse = getExistingUserNamesResponse();
    return _client.invoke<getExistingUserNamesResponse>(ctx, 'UserService', 'getExistingUserNames', request, emptyResponse);
  }
}

