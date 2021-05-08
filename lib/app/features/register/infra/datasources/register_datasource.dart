import 'package:dartz/dartz.dart';

import '../../domain/entities/logged_user_info.dart';
import '../../domain/errors/auth_failure.dart';
import '../../domain/errors/register_failure.dart';
import '../model/user_register_model.dart';

abstract class RegisterDataSource {
  Future<Either<RegisterFailure, LoggedUserInfo>> registerUser(
      UserRegisterModel user);
  Future<Either<AuthFailure, LoggedUserInfo>> currentUser();
  Future<Either<AuthFailure, Unit>> logget();
}
