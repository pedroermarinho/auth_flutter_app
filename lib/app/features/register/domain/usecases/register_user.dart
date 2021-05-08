import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../entities/logged_user_info.dart';
import '../entities/user_register_info.dart';
import '../entities/user_register_validate.dart';
import '../errors/register_failure.dart';
import '../repositories/register_repository.dart';

part 'register_user.g.dart';

abstract class RegisterUser {
  Future<Either<RegisterFailure, LoggedUserInfo>> call(UserRegisterInfo user);
}

@Injectable(singleton: false)
class RegisterUserImpl implements RegisterUser {
  final RegisterRepository repository;

  RegisterUserImpl(this.repository);

  @override
  Future<Either<RegisterFailure, LoggedUserInfo>> call(
      UserRegisterInfo user) async {
    final userRegisterValidate = UserRegisterValidate(user);

    if (!userRegisterValidate.isValidName) {
      return Left(ErrorRegisterUser(message: "Nome inválido"));
    } else if (!userRegisterValidate.isValidUsername) {
      return Left(ErrorRegisterUser(message: "Usuário inválido"));
    } else if (!userRegisterValidate.isValidPassword) {
      return Left(ErrorRegisterUser(message: "Senha inválido"));
    }

    return await repository.registerUser(user);
  }
}
