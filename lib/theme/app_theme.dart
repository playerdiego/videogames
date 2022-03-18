import 'package:flutter/material.dart';

class AppTheme {

  static Color primaryColor = Colors.redAccent;

  static ThemeData darkTheme = ThemeData.dark().copyWith(

    primaryColor: primaryColor,

    scaffoldBackgroundColor: Colors.black,

    appBarTheme: AppBarTheme(
      color: primaryColor
    ),
    backgroundColor: Colors.black

  );



}