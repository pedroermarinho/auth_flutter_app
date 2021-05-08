import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/domain/services/storage_service.dart';
import '../../../../core/presenter/utils/constants.dart';
import '../../domain/entities/logged_user_info.dart';
import '../../domain/errors/auth_failure.dart';
import '../../domain/errors/register_failure.dart';
import '../../infra/datasources/register_datasource.dart';
import '../../infra/model/user_model.dart';
import '../../infra/model/user_register_model.dart';

part 'register_datasource_impl.g.dart';

@Injectable(singleton: false)
class RegisterDataSourceImpl implements RegisterDataSource {
  final Dio dio;
  final StorageService service;

  RegisterDataSourceImpl(this.dio, this.service);

  Option<UserModel> _user = none();

  @override
  Future<Either<RegisterFailure, LoggedUserInfo>> registerUser(
      UserRegisterModel user) async {
    // try {
    final response = await dio.post(
      Constants.apiUrlUser,
      data: user.toJson(),
    );

    final result = UserModel(token: response.data["token"]);

    return (await service.put(Constants.keyToken, result.token))
        .fold((l) => Left(InternalError(message: l.message)), (_) {
      _user = optionOf(result);
      return Right(result);
    });
    // } on DioError catch (e) {
    //   print(e);
    //   if (ErrorApi.errorsApi.containsKey(e.response?.statusCode)) {
    //     return Left(ErrorRegisterUser(
    //       message: ErrorApi.errorsApi[e.response?.statusCode]!,
    //       statusCode: e.response?.statusCode,
    //     ));
    //   }
    //   return Left(RegisterServerErrorFailure(message: "Erro Desconhecido"));
    // } on Exception catch (e) {
    //   print(e);
    //   return Left(RegisterServerErrorFailure(message: e.toString()));
    // }
  }

  @override
  Future<Either<AuthFailure, LoggedUserInfo>> currentUser() async => _user.fold(
        () async => (await service.get(Constants.keyToken)).fold(
          (l) => Left(ErrorGetLoggedUser(message: l.message)),
          (token) => Right(UserModel(token: token)),
        ),
        (user) => Right(user),
      );

  @override
  Future<Either<AuthFailure, Unit>> logget() async {
    _user = none();
    return (await service.clear()).fold(
      (l) => Left(ErrorLogout(message: l.message)),
      (r) => Right(r),
    );
  }
}
