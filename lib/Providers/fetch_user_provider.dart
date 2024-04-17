// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:firebase_project/model/user/user_model.dart';

class UserState {
  final bool isLoading;
  final UserModel? userModel;

  UserState({
    required this.isLoading,
    this.userModel,
  });

  UserState copyWith({
    bool? isLoading,
    UserModel? userModel,
  }) {
    return UserState(
      isLoading: isLoading ?? this.isLoading,
      userModel: userModel ?? this.userModel,
    );
  }

  @override
  String toString() =>
      'UserState(isLoading: $isLoading, userModel: $userModel)';
}

class UserNotifier extends Notifier<UserState> {
  @override
  build() {
    return UserState(isLoading: false);
  }

  Future<void> getUser() async {
    final userUid = FirebaseAuth.instance.currentUser?.uid;

    if (userUid != null) {
      try {
        final snapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(userUid)
            .get();

        if (snapshot.exists) {
          final user = UserModel.fromJson(snapshot.data()!);

          state = state.copyWith(userModel: user);
        }
      } catch (e) {
        throw Exception('the error is : $e');
      }
    }
  }
}

final userProvider =
    NotifierProvider<UserNotifier, UserState>(UserNotifier.new);
