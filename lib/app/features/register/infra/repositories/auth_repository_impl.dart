import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entities/logged_user_info.dart';
import '../../domain/errors/auth_failure.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/register_datasource.dart';

part 'auth_repository_impl.g.dart';

@Injectable(singleton: false)
class AuthRepositoryImpl implements AuthRepository {
  final RegisterDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<Either<AuthFailure, LoggedUserInfo>> loggedUser() async =>
      await dataSource.currentUser();

  @override
  Future<Either<AuthFailure, Unit>> logout() async => dataSource.logget();
}
