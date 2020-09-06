import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';

abstract class BaseAuth {
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createWithEmailAndPassword(String email, String password);
  Future<String> currentUser();
  Future<void> signOut();

  createUserWithEmailAndPassword(String email, String password) {}
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String> signInWithEmailAndPassword(
      String email, String password) async {
    UserCredential user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    print('logging in');
    return user.user.uid;

    Future<String> createUserWithEmailAndPassword(
        String email, String password) async {
      // ignore: deprecated_member_use
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return user.user.uid;
    }
  }

  @override
  Future<String> createWithEmailAndPassword(String email, String password) {}

  Future<String> currentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser;
    return user.uid;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  @override
  createUserWithEmailAndPassword(String email, String password) {
    throw UnimplementedError();
  }
}
