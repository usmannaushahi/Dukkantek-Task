import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_task/Services/AuthService.dart';

import '../wrapper.dart';

Widget OutlineButtonCustomized(
    {Color ?color,
    String ?text,
    Function()? onPressed,
    @required BuildContext? context}) {
  return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: 1.0,
          color: color!,
          style: BorderStyle.solid,
        ),
      ),
      child: Text(
        text!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
          fontSize: Get.width * 0.05,
        ),
      ));
}

 Widget GoogleButton({Function()? onPressed, bool? isLogin}){
  return OutlinedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    ),
    onPressed: onPressed,
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            image: AssetImage("assets/images/google_logo.png"),
            height: 35.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Sign ${isLogin == true? "In":"Up"} with Google',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    ),
  );
 }

