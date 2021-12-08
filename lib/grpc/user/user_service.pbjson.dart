///
//  Generated code. Do not modify.
//  source: user/user_service.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const User$json = const {
  '1': 'User',
  '2': const [
    const {'1': 'firstName', '3': 1, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'profilePic', '3': 3, '4': 1, '5': 9, '10': 'profilePic'},
    const {'1': 'mobileNo', '3': 4, '4': 1, '5': 9, '10': 'mobileNo'},
    const {'1': 'status', '3': 5, '4': 1, '5': 9, '10': 'status'},
    const {'1': 'userName', '3': 6, '4': 1, '5': 9, '10': 'userName'},
  ],
};

const AddUserResponse$json = const {
  '1': 'AddUserResponse',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'err', '3': 2, '4': 1, '5': 11, '6': '.user_grpc.Error', '10': 'err'},
  ],
};

const UploadProfilePicRequest$json = const {
  '1': 'UploadProfilePicRequest',
  '2': const [
    const {'1': 'profilePicPath', '3': 1, '4': 1, '5': 9, '10': 'profilePicPath'},
    const {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.user_grpc.User', '10': 'user'},
  ],
};

const MyMessages$json = const {
  '1': 'MyMessages',
  '2': const [
    const {'1': 'userMsg', '3': 1, '4': 3, '5': 11, '6': '.user_grpc.UserMsg', '10': 'userMsg'},
    const {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.user_grpc.Error', '10': 'error'},
  ],
};

const UserMsg$json = const {
  '1': 'UserMsg',
  '2': const [
    const {'1': 'fromUserId', '3': 1, '4': 1, '5': 9, '10': 'fromUserId'},
    const {'1': 'msg', '3': 2, '4': 1, '5': 9, '10': 'msg'},
  ],
};

const getUserByUserIdRequest$json = const {
  '1': 'getUserByUserIdRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

const getUserByUserNameRequest$json = const {
  '1': 'getUserByUserNameRequest',
  '2': const [
    const {'1': 'userName', '3': 1, '4': 1, '5': 9, '10': 'userName'},
  ],
};

const searchUsersByUserNameResponse$json = const {
  '1': 'searchUsersByUserNameResponse',
  '2': const [
    const {'1': 'user', '3': 1, '4': 3, '5': 11, '6': '.user_grpc.User', '10': 'user'},
  ],
};

const UserName$json = const {
  '1': 'UserName',
  '2': const [
    const {'1': 'userName', '3': 1, '4': 1, '5': 9, '10': 'userName'},
  ],
};

const getExistingUserNamesRequest$json = const {
  '1': 'getExistingUserNamesRequest',
  '2': const [
    const {'1': 'sample', '3': 1, '4': 1, '5': 9, '10': 'sample'},
  ],
};

const getExistingUserNamesResponse$json = const {
  '1': 'getExistingUserNamesResponse',
  '2': const [
    const {'1': 'userName', '3': 1, '4': 3, '5': 11, '6': '.user_grpc.UserName', '10': 'userName'},
  ],
};

const StatusOkResponse$json = const {
  '1': 'StatusOkResponse',
  '2': const [
    const {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'successCode', '3': 2, '4': 1, '5': 5, '10': 'successCode'},
    const {'1': 'err', '3': 3, '4': 1, '5': 11, '6': '.user_grpc.Error', '10': 'err'},
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

const UserServiceBase$json = const {
  '1': 'UserService',
  '2': const [
    const {'1': 'add', '2': '.user_grpc.User', '3': '.user_grpc.AddUserResponse'},
    const {'1': 'uploadProfilePic', '2': '.user_grpc.UploadProfilePicRequest', '3': '.user_grpc.StatusOkResponse'},
    const {'1': 'loadMyMessages', '2': '.user_grpc.User', '3': '.user_grpc.MyMessages'},
    const {'1': 'getUserByUserId', '2': '.user_grpc.getUserByUserIdRequest', '3': '.user_grpc.User'},
    const {'1': 'update', '2': '.user_grpc.User', '3': '.user_grpc.StatusOkResponse'},
    const {'1': 'searchUsersByUserName', '2': '.user_grpc.getUserByUserNameRequest', '3': '.user_grpc.searchUsersByUserNameResponse'},
    const {'1': 'getExistingUserNames', '2': '.user_grpc.getExistingUserNamesRequest', '3': '.user_grpc.getExistingUserNamesResponse'},
  ],
};

const UserServiceBase$messageJson = const {
  '.user_grpc.User': User$json,
  '.user_grpc.AddUserResponse': AddUserResponse$json,
  '.user_grpc.Error': Error$json,
  '.user_grpc.UploadProfilePicRequest': UploadProfilePicRequest$json,
  '.user_grpc.StatusOkResponse': StatusOkResponse$json,
  '.user_grpc.MyMessages': MyMessages$json,
  '.user_grpc.UserMsg': UserMsg$json,
  '.user_grpc.getUserByUserIdRequest': getUserByUserIdRequest$json,
  '.user_grpc.getUserByUserNameRequest': getUserByUserNameRequest$json,
  '.user_grpc.searchUsersByUserNameResponse': searchUsersByUserNameResponse$json,
  '.user_grpc.getExistingUserNamesRequest': getExistingUserNamesRequest$json,
  '.user_grpc.getExistingUserNamesResponse': getExistingUserNamesResponse$json,
  '.user_grpc.UserName': UserName$json,
};

