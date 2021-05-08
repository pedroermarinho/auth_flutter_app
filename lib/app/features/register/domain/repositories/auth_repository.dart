import 'package:dartz/dartz.dart';

import '../entities/logged_user_info.dart';
import '../errors/auth_failure.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, LoggedUserInfo>> loggedUser();

  Future<Either<AuthFailure, Unit>> logout();
}
