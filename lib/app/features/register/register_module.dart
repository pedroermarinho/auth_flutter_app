import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/get_logged_user.dart';
import 'domain/usecases/logout.dart';
import 'domain/usecases/register_user.dart';
import 'external/datasources/register_datasource_impl.dart';
import 'infra/repositories/auth_repository_impl.dart';
import 'infra/repositories/register_repository_impl.dart';
import 'presenter/pages/register/register_controller.dart';
import 'presenter/pages/register/register_page.dart';

// ignore: must_be_immutable
class RegisterModule extends WidgetModule {
  static List<Bind> export = [
    $GetLoggedUserImpl,
    $RegisterUserImpl,
    $LogoutImpl,
    $AuthRepositoryImpl,
    $RegisterRepositoryImpl,
    $RegisterDataSourceImpl,
  ];

  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => RegisterController(i.get()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => RegisterPage()),
      ];

  @override
  Widget get view => RegisterPage();
}
