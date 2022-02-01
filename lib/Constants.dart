import 'package:flutter/material.dart';

String kReviewLink = "https://www.youtube.com/watch?v=_i_XWx05FTw";
String kProductsAPIUrl = "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline";


InputDecoration kTextFieldInputDecorationWithBorders(
    String hintText, String labelText, IconData icon) {
  return InputDecoration(
    labelText: labelText,
    hintText: hintText,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  );
}
