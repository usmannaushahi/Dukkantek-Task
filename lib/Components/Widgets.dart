import 'package:flutter/material.dart';
import 'package:youtube_task/Responsive_Layout.dart';

Widget OutlineButtonCustomized(
    {Color color,
    String text,
    Function onPressed,
    @required BuildContext context}) {
  return OutlineButton(
    onPressed: onPressed,
    borderSide: BorderSide(color: color),
    color: color,
    disabledBorderColor: color,
    highlightedBorderColor: color,
    highlightColor: color,
    focusColor: color,
    hoverColor: color,
    disabledTextColor: color,
    splashColor: color,
    child: Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
          fontSize: ResponsiveLayout(context: context).width() * 0.05),
    ),
  );
}
