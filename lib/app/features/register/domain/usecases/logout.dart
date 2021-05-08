import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../errors/auth_failure.dart';
import '../repositories/auth_repository.dart';

part 'logout.g.dart';

abstract class Logout {
  Future<Either<AuthFailure, Unit>> call();
}

@Injectable(singleton: false)
class LogoutImpl implements Logout {
  final AuthRepository repository;

  LogoutImpl(this.repository);

  @override
  Future<Either<AuthFailure, Unit>> call() async => await repository.logout();
}
