import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/Screen/home_screen.dart';
import 'package:flutter/material.dart';

class UserLoginRepo {
  final _auth = FirebaseAuth.instance;

  void login(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      var userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        if (!context.mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(' User does not exist. try to Sign Up'),
        ),
      );
    }
  }
}
