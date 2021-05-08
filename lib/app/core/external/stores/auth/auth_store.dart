import 'dart:async';

import 'package:asuka/asuka.dart' as asuka;
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../features/register/domain/entities/logged_user_info.dart';
import '../../../../features/register/domain/usecases/get_logged_user.dart';
import '../../../../features/register/domain/usecases/logout.dart';

part 'auth_store.g.dart';

abstract class AuthStore {
  bool get isLogged;
  Option<LoggedUserInfo> get user;

  void setUser(LoggedUserInfo user);
  Future<bool> checkLogin();
  Future signOut();
}

class AuthStoreImpl = _AuthStoreImplBase with _$AuthStoreImpl;

abstract class _AuthStoreImplBase with Store implements AuthStore {
  final GetLoggedUser getLoggedUser;
  final Logout logout;
  _AuthStoreImplBase({
    required this.getLoggedUser,
    required this.logout,
  });

  @observable
  @override
  Option<LoggedUserInfo> user = none();

  @computed
  @override
  bool get isLogged => user.isSome();

  @action
  @override
  void setUser(LoggedUserInfo value) => user = optionOf(value);

  @override
  Future<bool> checkLogin() async {
    var result = await (getLoggedUser());
    return result.fold((l) => false, (user) {
      setUser(user);
      return true;
    });
  }

  @override
  Future signOut() async {
    final result = await logout();
    result.fold((l) {
      asuka.showSnackBar(SnackBar(content: Text(l.message)));
    }, (r) {
      userClean();
      Modular.to.pushReplacementNamed(Modular.initialRoute);
    });
  }

  void userClean() => user = None();
}
