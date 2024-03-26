import 'package:firebase_project/model/user/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Import your UserModel class

final userModelProvider = Provider<UserModel>((ref) {
  // Initialize your UserModel here
  return UserModel(); // Replace with your initialization logic
});
