import 'package:flutter/material.dart';

class ResponsiveLayout {
  BuildContext context;

  ResponsiveLayout({this.context});

  double height() {
    return MediaQuery.of(context).size.height;
  }

  double width() {
    return MediaQuery.of(context).size.width;
  }
}
