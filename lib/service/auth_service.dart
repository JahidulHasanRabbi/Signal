import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  final FirebaseAuth _firebaseauth = FirebaseAuth.instance;

  Future<UserCredential> signWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential usercredential = await _firebaseauth
          .signInWithEmailAndPassword(email: email, password: password);
      return usercredential;
    } on FirebaseAuthException catch (e) {
      throw (e.code);
    }
  }
}
