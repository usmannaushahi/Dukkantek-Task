import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
