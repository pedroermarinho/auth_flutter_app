import 'package:string_validator/string_validator.dart' as validator;

import 'user_register_info.dart';

class UserRegisterValidate {
  final UserRegisterInfo user;

  UserRegisterValidate(this.user);

  bool get isValidName => user.name.isNotEmpty && user.name.length > 5;

  bool get isValidUsername =>
      user.username.isNotEmpty &&
      user.username.length >= 4 &&
      !validator.isEmail(user.username);

  bool get isValidPassword =>
      user.password.isNotEmpty && user.password.length > 4;

  bool get isValidEmail => validator.isEmail(user.email);
}
