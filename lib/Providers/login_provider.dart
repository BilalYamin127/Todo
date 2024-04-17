// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_project/repositiry/user_login_repositiry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginState {
  bool isLogin;
  LoginState({
    required this.isLogin,
  });

  LoginState copyWith({
    bool? isLogin,
  }) {
    return LoginState(
      isLogin: isLogin ?? this.isLogin,
    );
  }

  @override
  String toString() => 'LoginState(isLogin: $isLogin)';
}

class LoginNotifier extends Notifier<LoginState> {
  @override
  build() {
    return LoginState(isLogin: false);
  }

  void login(String email, String password, BuildContext context) {
    final loginRepo = UserLoginRepo();
    loginRepo.login(email, password, context);
  }
}

final loginProvider =
    NotifierProvider<LoginNotifier, LoginState>(LoginNotifier.new);
