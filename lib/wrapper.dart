import 'package:flutter/material.dart';
import 'package:youtube_task/Main_Screens/Main_Screen.dart';
import 'package:youtube_task/Models/User.dart';
import 'package:youtube_task/Services/AuthService.dart';
import 'package:youtube_task/User_Management_Screens/Login_Screen.dart';
import 'package:youtube_task/Youtube%20Screen/Youtube_Screen.dart';

class Wrapper extends StatelessWidget {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModel>(
        stream: _auth.user,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Main_Screen();
          } else {
            return Login_Screen();
          }
        });
  }
}
