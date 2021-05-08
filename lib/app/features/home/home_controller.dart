import 'package:mobx/mobx.dart';

import '../../core/external/stores/auth/auth_store.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final AuthStore authStore;

  HomeControllerBase(this.authStore);

  void signOut() async {
    authStore.signOut();
  }
}
