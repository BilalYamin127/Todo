import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/model/user/user_model.dart';
import 'package:flutter/material.dart';

class UserSignUpRepo {
  BuildContext context;
  UserSignUpRepo({required this.context});
  bool isStore = false;

  Future<void> storeUserModelInFirestore(UserModel userModel) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final userCollection = firestore.collection('Users');
      // Convert userModel to JSON
      await userCollection.doc(userModel.id).set(userModel.toJson());
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(' User data stored in Firestore successfully'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text('error in data store $e'),
        ),
      );
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

      await storeUserModelInFirestore(userModel);
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(' Error in storing data in  userModel: $e'),
        ),
      );
    }
  }
}
