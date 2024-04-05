import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/model/user/user_model.dart';

class UserSignUpRepo {
  Future<void> storeUserModelInFirestore(UserModel userModel) async {
    try {
      final firestore = FirebaseFirestore.instance;
      final userCollection = firestore.collection('Users');
      // Convert userModel to JSON
      await userCollection.doc(userModel.id).set(userModel.toJson());
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

      await storeUserModelInFirestore(userModel);
      print('User data stored in Firestore successfully');
    } catch (e) {
      print('Error creating user: $e');
    }
  }
}
