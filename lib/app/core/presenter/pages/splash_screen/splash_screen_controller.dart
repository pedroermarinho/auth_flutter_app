import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../external/stores/auth/auth_store.dart';

part 'splash_screen_controller.g.dart';

class SplashScreenController = _SplashScreenControllerBase
    with _$SplashScreenController;

abstract class _SplashScreenControllerBase with Store {
  final AuthStore authStore;

  _SplashScreenControllerBase({
    required this.authStore,
  });

  void init() {
    Future.delayed(Duration(seconds: 1)).then((value) => checkAuth());
  }

  Future<void> checkAuth() async {
    if (await authStore.checkLogin()) {
      Modular.to.pushReplacementNamed('/home');
      return;
    }

    Modular.to.pushReplacementNamed('/register');
  }
}
