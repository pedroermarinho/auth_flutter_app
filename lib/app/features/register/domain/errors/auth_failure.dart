abstract class AuthFailure implements Exception {
  String get message;
  int? get statusCode;
}

class ErrorGetLoggedUser extends AuthFailure {
  final String message;
  final int? statusCode;
  ErrorGetLoggedUser({required this.message, this.statusCode});
}

class ErrorLogout extends AuthFailure {
  final String message;
  final int? statusCode;
  ErrorLogout({required this.message, this.statusCode});
}

class ErrorGetToken extends AuthFailure {
  final String message;
  final int? statusCode;
  ErrorGetToken({required this.message, this.statusCode});
}

class ErrorSetToken extends AuthFailure {
  final String message;
  final int? statusCode;
  ErrorSetToken({required this.message, this.statusCode});
}
