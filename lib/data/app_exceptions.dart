

class AppExceptions implements Exception{
  final _message;
  final _prefix;
  /// Constructor
  AppExceptions([this._message, this._prefix]);

  String toString(){
    return '$_prefix $_message';
  }
}

class FetchDataExceptions extends AppExceptions{
  FetchDataExceptions([String? message]) : super(message, 'Error During Communications');
}

class BadRequestException extends AppExceptions{
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

class UnauthorisedException extends AppExceptions{
  UnauthorisedException([String? message]) : super(message, 'Unauthorised Request');
}

class InvalidInputException extends AppExceptions{
  InvalidInputException([String? message]) : super(message, 'invalid input request');
}