import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/model/user/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserSignUpRepo {
  Future<void> storeUserDataInFirestore(User user, UserModel userModel) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final userCollection = firestore.collection('Users');
      final userData = userModel.toJson(); // Convert userModel to JSON
      await userCollection.add(userData);
      print('User data stored in Firestore successfully');
    } catch (e) {
      print('Error storing user data: $e');
    }
  }

  Future<void> createUserWithFirebaseAuth(
      String email, String password, String username) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = userCredential.user!;
      UserModel userModel = UserModel(
        email: email,
        username: username,
        password: password,
        id: user.uid,
      );

      await storeUserDataInFirestore(user, userModel);
      print('User data stored in Firestore successfully');
    } catch (e) {
      print('Error creating user: $e');
    }
  }
}

final userModelProvider = Provider<UserModel>((ref) {
  // Initialize your UserModel here
  return UserModel(); // Example initialization, replace with your logic
});
