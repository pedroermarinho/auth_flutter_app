import 'package:dartz/dartz.dart';

import '../entities/logged_user_info.dart';
import '../entities/user_register_info.dart';
import '../errors/register_failure.dart';

abstract class RegisterRepository {
  Future<Either<RegisterFailure, LoggedUserInfo>> registerUser(
      UserRegisterInfo user);
}
