import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../entities/logged_user_info.dart';
import '../errors/auth_failure.dart';
import '../repositories/auth_repository.dart';

part 'get_logged_user.g.dart';

abstract class GetLoggedUser {
  Future<Either<AuthFailure, LoggedUserInfo>> call();
}

@Injectable(singleton: false)
class GetLoggedUserImpl implements GetLoggedUser {
  final AuthRepository repository;

  GetLoggedUserImpl(this.repository);

  @override
  Future<Either<AuthFailure, LoggedUserInfo>> call() async =>
      await repository.loggedUser();
}
