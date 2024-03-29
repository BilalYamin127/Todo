// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase_project/repositiry/user_signup_repositiry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpState {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final bool isLoading;
  SignUpState({
    required this.isLoading,
  });

  SignUpState copyWith({
    bool? isLoading,
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  String toString() => 'SignUpState(isLoading: $isLoading)';
}

class SignupNotifier extends Notifier<SignUpState> {
  void setIsLoading() {
    //final isloading = state.isLoading;
    state = state.copyWith(isLoading: false);
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      final userRepo = UserSignUpRepo();
      await userRepo.createUserWithFirebaseAuth(email, password, username);
    } catch (e) {
      print('Error creating user: $e');
    }
  }

  @override
  SignUpState build() {
    throw UnimplementedError();
  }
}

final signupprovider =
    NotifierProvider<SignupNotifier, SignUpState>(SignupNotifier.new);
