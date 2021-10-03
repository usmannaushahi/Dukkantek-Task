import 'package:flutter/material.dart';

String kReviewLink = "https://www.youtube.com/watch?v=_i_XWx05FTw";
String kProductsAPIUrl = "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";

bool kValidateEmail(String email) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(email)) ? false : true;
}

InputDecoration kTextFieldInputDecorationWithoutBorders(
    String hintText, String labelText, IconData icon) {
  return InputDecoration(
    prefixIcon: Icon(icon, color: Color.fromRGBO(50, 62, 72, 1.0)),
    labelText: labelText,
    hintText: hintText,
  );
}

InputDecoration kTextFieldInputDecorationWithBorders(
    String hintText, String labelText, IconData icon) {
  return InputDecoration(
    labelText: labelText,
    hintText: hintText,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
}
