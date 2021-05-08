import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/entities/user_register_info.dart';
import '../../../domain/entities/user_register_validate.dart';
import '../../../domain/usecases/register_user.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store implements UserRegisterInfo {
  final RegisterUser registerUser;

  _RegisterControllerBase(this.registerUser);

  @observable
  String name = '';

  @action
  void setName(String value) => name = value;

  @computed
  String? get isValidName => validate.isValidName ? null : "Nome inválido";

  @observable
  String username = '';

  @action
  void setUsername(String value) => username = value;

  @computed
  String? get isValidUsername =>
      validate.isValidUsername ? null : "Nome de Usuario inválido";

  @observable
  String password = '';

  @action
  void setPassword(String value) => password = value;

  @computed
  String? get isValidPassword =>
      validate.isValidPassword ? null : "Senha inválido";

  @observable
  String password2 = '';

  @action
  void setPassword2(String value) => password2 = value;

  @computed
  String? get isValidPassword2 =>
      password == password2 ? null : "Senhas não correspondentes";

  @observable
  String email = '';

  @action
  void setEmail(String value) => email = value;

  @computed
  String? get isValidEmail => validate.isValidEmail ? null : "Email inválido";

  @computed
  UserRegisterValidate get validate => UserRegisterValidate(this);

  void onRegister() async {
    final result = await registerUser(this);
    result.fold((l) {
      asuka.showSnackBar(SnackBar(content: Text(l.message)));
    }, (r) {
      Modular.to.pushReplacementNamed(Modular.initialRoute);
    });
  }
}
