import 'dart:convert';

import '../../domain/entities/logged_user.dart';
import '../../domain/entities/logged_user_info.dart';

// ignore: must_be_immutable
class UserModel extends LoggedUser implements LoggedUserInfo {
  UserModel({required String token}) : super(token: token);

  LoggedUser toLoggedUser() => this;

  Map<String, dynamic> toMap() => {'token': token};

  static UserModel fromMap(Map<String, dynamic> map) =>
      UserModel(token: map['token']);

  String toJson() => json.encode(toMap());

  static UserModel fromJson(String source) => fromMap(json.decode(source));
}
