// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_project/repositiry/user_signup_repositiry.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpState {
  final bool? isLoading;
  SignUpState({
    this.isLoading,
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
    state = state.copyWith(isLoading: false);
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String username, context) async {
    try {
      final userRepo = UserSignUpRepo(context: context);
      await userRepo.createUserWithFirebaseAuth(
        email,
        password,
        username,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  SignUpState build() {
    return SignUpState(isLoading: false);
  }
}

final signupprovider =
    NotifierProvider<SignupNotifier, SignUpState>(SignupNotifier.new);
