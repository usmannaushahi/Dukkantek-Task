import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:youtube_task/Models/User.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


   Future signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
    await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
        await auth.signInWithCredential(credential);

        user = userCredential.user;
        return _userFromfirebaseuser(user);

      } on FirebaseAuthException catch (e) {
        print('exception');
        if (e.code == 'account-exists-with-different-credential') {
          print('existed');
        }
        else if (e.code == 'invalid-credential') {
          print('invalid');
        }
      } catch (e) {
      }
    }

    return _userFromfirebaseuser(user);
  }



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
