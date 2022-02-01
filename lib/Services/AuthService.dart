import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:youtube_task/Models/User.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future logoutUser() async {
    await _auth.signOut();
  }

  UserModel _userFromfirebaseuser(User? user) {
    return user != null ? UserModel(uid: user.uid, email: user.email) : null!;
  }

  Stream<UserModel> get user {
    return _auth.authStateChanges().map(_userFromfirebaseuser);
  }

  Future createUserwithEmailPassword({String ?email, String ?password}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!);
      User user = userCredential.user!;
      return _userFromfirebaseuser(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signinUserwithEmailPassword({String ?email, String? password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email!, password: password!);
      User user = userCredential.user!;
      return _userFromfirebaseuser(user);
    } on FirebaseAuthException catch (e) {
      print(e);
    } catch (e) {
      print(e);
    }
  }
}
