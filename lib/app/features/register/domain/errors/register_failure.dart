abstract class RegisterFailure implements Exception {
  String get message;
  int? get statusCode;
}

class ErrorRegisterUserCreate extends RegisterFailure {
  final String message;
  final int? statusCode;
  ErrorRegisterUserCreate({required this.message, this.statusCode});
}

class ErrorRegisterUser extends RegisterFailure {
  final String message;
  final int? statusCode;
  ErrorRegisterUser({required this.message, this.statusCode});
}

class RegisterServerErrorFailure implements RegisterFailure {
  final String message;
  final int? statusCode;
  RegisterServerErrorFailure({required this.message, this.statusCode});
}

class InternalError implements RegisterFailure {
  final String message;
  final int? statusCode;
  InternalError({required this.message, this.statusCode});
}
