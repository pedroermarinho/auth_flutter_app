import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/external/drivers/hive_storage_driver_impl.dart';
import 'core/external/stores/auth/auth_store.dart';
import 'core/infra/services/storage_service_impl.dart';
import 'core/presenter/components/loading_dialog.dart';
import 'core/presenter/components/success_dialog.dart';
import 'core/presenter/pages/not_found/not_found_page.dart';
import 'core/presenter/pages/splash_screen/splash_screen_controller.dart';
import 'core/presenter/pages/splash_screen/splash_screen_page.dart';
import 'core/presenter/utils/dio_fake.dart';
import 'features/home/home_module.dart';
import 'features/register/register_module.dart';

/// Classe principal para fazer as injeções de dependencias
class AppModule extends Module {
  @override
  final List<Bind> binds = [
    ...RegisterModule.export,
    Bind.instance<Dio>(DioFake.instance),
    BindInject(
      (i) => HiveStorageDriver(),
      isSingleton: false,
    ),
    Bind(
      (i) => StorageServiceImpl(i()),
      isSingleton: false,
    ),
    Bind.lazySingleton<LoadingDialog>(
      (i) => LoadingDialogImpl(),
    ),
    Bind.lazySingleton(
      (i) => SuccessDialogImpl(),
    ),
    Bind.lazySingleton((i) => AuthStoreImpl(
          getLoggedUser: i(),
          logout: i(),
        )),
    Bind.lazySingleton(
      (i) => SplashScreenController(
        authStore: i(),
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => SplashScreenPage()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/register', module: RegisterModule()),
    WildcardRoute(child: (_, args) => NotFoundPage()),
  ];
}
