import 'package:auth_flutter_app/app/features/register/domain/entities/user_register_validate.dart';
import 'package:auth_flutter_app/app/features/register/infra/model/user_register_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final userRegister = UserRegisterModel(
    name: "pedro marinho",
    username: "pedro",
    password: "12345678",
    email: "pedroermarinho@gmail.com",
  );

  group('deve verificar se os campos são validos ou não', () {
    test('email', () {
      expect(
        UserRegisterValidate(userRegister.withOption(email: "")).isValidEmail,
        false,
      );

      expect(
        UserRegisterValidate(userRegister.withOption(email: "pedro"))
            .isValidEmail,
        false,
      );

      expect(
        UserRegisterValidate(userRegister).isValidEmail,
        true,
      );
    });
    test('senha', () {
      expect(
        UserRegisterValidate(userRegister.withOption(password: ""))
            .isValidPassword,
        false,
      );

      expect(
        UserRegisterValidate(userRegister.withOption(password: "1234"))
            .isValidPassword,
        false,
      );

      expect(
        UserRegisterValidate(userRegister).isValidPassword,
        true,
      );
    });

    test('username', () {
      expect(
        UserRegisterValidate(userRegister.withOption(username: ""))
            .isValidUsername,
        false,
      );

      expect(
        UserRegisterValidate(userRegister).isValidUsername,
        true,
      );

      expect(
        UserRegisterValidate(
                userRegister.withOption(username: "pedroermarinho@gmail.com"))
            .isValidUsername,
        false,
      );
    });
    test('name', () {
      expect(
        UserRegisterValidate(userRegister.withOption(name: "")).isValidName,
        false,
      );

      expect(
        UserRegisterValidate(userRegister).isValidName,
        true,
      );
    });
  });
}
