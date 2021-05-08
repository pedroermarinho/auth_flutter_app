import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entities/logged_user_info.dart';
import '../../domain/entities/user_register_info.dart';
import '../../domain/errors/register_failure.dart';
import '../../domain/repositories/register_repository.dart';
import '../datasources/register_datasource.dart';
import '../model/user_register_model.dart';

part 'register_repository_impl.g.dart';

@Injectable(singleton: false)
class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterDataSource dataSource;

  RegisterRepositoryImpl({required this.dataSource});

  @override
  Future<Either<RegisterFailure, LoggedUserInfo>> registerUser(
          UserRegisterInfo user) async =>
      await dataSource
          .registerUser(UserRegisterModel.fromUserRegisterInfo(user));
}
