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
    print(userUid);

    if (userUid != null) {
      try {
        print('user is not null: $userUid');
        var snapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(userUid)
            .get();
        print('Snapshot data: ${snapshot.data()}'); // Log snapshot data
        if (snapshot.exists) {
          print('Snapshot exists'); // Log if snapshot exists
          final user = UserModel.fromJson(snapshot.data()!);

          state = state.copyWith(userModel: user);
        } else {
          print('Snapshot does not exist'); // Log if snapshot does not exist
        }
      } catch (e) {
        print('the error is : $e');
        throw e; // Throw the error to propagate it
      }
    }

    throw Exception('User not found');
  }
}

final userProvider =
    NotifierProvider<UserNotifier, UserState>(UserNotifier.new);
