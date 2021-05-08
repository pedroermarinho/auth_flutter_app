import 'user_register_info.dart';

class UserRegister implements UserRegisterInfo {
  final String name;
  final String username;
  final String password;
  final String email;

  UserRegister({
    required this.name,
    required this.username,
    required this.password,
    required this.email,
  });
}
