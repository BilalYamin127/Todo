import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_project/model/User/user_model.dart';

class FirebaseAuthServices {
  final _db = FirebaseFirestore.instance;

  creatuser(UserModel user) async {
    final bb = await _db.collection('User').add(user.toJson());
    print(' kdsfjslkf $bb');
  }
}
