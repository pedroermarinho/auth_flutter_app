// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStoreImpl on _AuthStoreImplBase, Store {
  Computed<bool>? _$isLoggedComputed;

  @override
  bool get isLogged =>
      (_$isLoggedComputed ??= Computed<bool>(() => super.isLogged,
              name: '_AuthStoreImplBase.isLogged'))
          .value;

  final _$userAtom = Atom(name: '_AuthStoreImplBase.user');

  @override
  Option<LoggedUserInfo> get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(Option<LoggedUserInfo> value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$_AuthStoreImplBaseActionController =
      ActionController(name: '_AuthStoreImplBase');

  @override
  void setUser(LoggedUserInfo value) {
    final _$actionInfo = _$_AuthStoreImplBaseActionController.startAction(
        name: '_AuthStoreImplBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_AuthStoreImplBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isLogged: ${isLogged}
    ''';
  }
}
