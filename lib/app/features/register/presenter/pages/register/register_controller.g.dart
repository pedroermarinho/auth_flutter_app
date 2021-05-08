// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterControllerBase, Store {
  Computed<String?>? _$isValidNameComputed;

  @override
  String? get isValidName =>
      (_$isValidNameComputed ??= Computed<String?>(() => super.isValidName,
              name: '_RegisterControllerBase.isValidName'))
          .value;
  Computed<String?>? _$isValidUsernameComputed;

  @override
  String? get isValidUsername => (_$isValidUsernameComputed ??=
          Computed<String?>(() => super.isValidUsername,
              name: '_RegisterControllerBase.isValidUsername'))
      .value;
  Computed<String?>? _$isValidPasswordComputed;

  @override
  String? get isValidPassword => (_$isValidPasswordComputed ??=
          Computed<String?>(() => super.isValidPassword,
              name: '_RegisterControllerBase.isValidPassword'))
      .value;
  Computed<String?>? _$isValidPassword2Computed;

  @override
  String? get isValidPassword2 => (_$isValidPassword2Computed ??=
          Computed<String?>(() => super.isValidPassword2,
              name: '_RegisterControllerBase.isValidPassword2'))
      .value;
  Computed<String?>? _$isValidEmailComputed;

  @override
  String? get isValidEmail =>
      (_$isValidEmailComputed ??= Computed<String?>(() => super.isValidEmail,
              name: '_RegisterControllerBase.isValidEmail'))
          .value;
  Computed<UserRegisterValidate>? _$validateComputed;

  @override
  UserRegisterValidate get validate => (_$validateComputed ??=
          Computed<UserRegisterValidate>(() => super.validate,
              name: '_RegisterControllerBase.validate'))
      .value;

  final _$nameAtom = Atom(name: '_RegisterControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$usernameAtom = Atom(name: '_RegisterControllerBase.username');

  @override
  String get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$passwordAtom = Atom(name: '_RegisterControllerBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$password2Atom = Atom(name: '_RegisterControllerBase.password2');

  @override
  String get password2 {
    _$password2Atom.reportRead();
    return super.password2;
  }

  @override
  set password2(String value) {
    _$password2Atom.reportWrite(value, super.password2, () {
      super.password2 = value;
    });
  }

  final _$emailAtom = Atom(name: '_RegisterControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$_RegisterControllerBaseActionController =
      ActionController(name: '_RegisterControllerBase');

  @override
  void setName(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword2(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setPassword2');
    try {
      return super.setPassword2(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_RegisterControllerBaseActionController.startAction(
        name: '_RegisterControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
username: ${username},
password: ${password},
password2: ${password2},
email: ${email},
isValidName: ${isValidName},
isValidUsername: ${isValidUsername},
isValidPassword: ${isValidPassword},
isValidPassword2: ${isValidPassword2},
isValidEmail: ${isValidEmail},
validate: ${validate}
    ''';
  }
}
