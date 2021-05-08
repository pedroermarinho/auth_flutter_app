import 'dart:convert';

import '../../domain/entities/user_register.dart';
import '../../domain/entities/user_register_info.dart';

class UserRegisterModel extends UserRegister implements UserRegisterInfo {
  final String name;
  final String username;
  final String password;
  final String email;

  UserRegisterModel({
    required this.name,
    required this.username,
    required this.password,
    required this.email,
  }) : super(
          name: name,
          username: username,
          password: password,
          email: email,
        );

  UserRegister toUserRegister() => this;

  static UserRegisterModel fromUserRegisterInfo(
          UserRegisterInfo userRegister) =>
      UserRegisterModel(
        name: userRegister.name,
        username: userRegister.username,
        password: userRegister.password,
        email: userRegister.email,
      );

  UserRegisterModel withOption({
    String? name,
    String? username,
    String? password,
    String? email,
  }) =>
      UserRegisterModel(
        name: name ?? this.name,
        username: username ?? this.username,
        password: password ?? this.password,
        email: email ?? this.email,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'username': username,
        'password': password,
        'email': email,
      };

  static UserRegisterModel fromMap(Map<String, dynamic> map) =>
      UserRegisterModel(
        name: map['name'],
        username: map['token'],
        password: map['token'],
        email: map['token'],
      );

  String toJson() => json.encode(toMap());

  static UserRegisterModel fromJson(String source) =>
      fromMap(json.decode(source));
}
