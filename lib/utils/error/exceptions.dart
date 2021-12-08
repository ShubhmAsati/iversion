class FailureError{
  String errorMessage;
  dynamic err;
  int errorCode;
  FailureError({this.errorMessage,this.errorCode,this.err});
  @override
  String toString() => errorMessage;
}

class FailureErrorPropagatedToUi{
  String errorMessage;
  dynamic err;
  int errorCode;
  FailureErrorPropagatedToUi({this.errorMessage,this.errorCode,this.err});
  @override
  String toString() => errorMessage;
}

class FailureErrorLeadsToAwwSnap{
  String errorMessage;
  dynamic err;
  int errorCode;
  FailureErrorLeadsToAwwSnap({this.errorMessage,this.errorCode,this.err});
  @override
  String toString() => errorMessage;
}

