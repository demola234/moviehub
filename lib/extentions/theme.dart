import 'package:flutter/material.dart';

class MyTheme {
  Brightness brightness;
  Color splashColor;
  Color backgroundColor;
  Color scaffoldBackgroundColor;
  Color primaryColor;
  Color secondaryColor;
  Color accentColor;

  MyTheme({
    required this.brightness,
    required this.backgroundColor,
    required this.scaffoldBackgroundColor,
    required this.primaryColor,
    required this.secondaryColor,
    required this.accentColor,
    required this.splashColor,
  });
}

class AppTheme {
  String name;
  MyTheme theme;

  AppTheme(this.name, this.theme);
}

final List<AppTheme> myTheme = [
  AppTheme(
      "Default",
      MyTheme(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        scaffoldBackgroundColor: Colors.grey,
        primaryColor: Color(0xFFD71D1D),
        secondaryColor: Colors.black,
        accentColor: Color(0xFFD71D1D),
        splashColor: Colors.black.withOpacity(0.2),
      )),

      AppTheme(
      "DarkMode",
      MyTheme(
        brightness: Brightness.dark,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Color(0xFFD71D1D),
        secondaryColor: Colors.black,
        accentColor: Color(0xFFD71D1D),
        splashColor: Colors.black.withOpacity(0.2),
      )),
];
