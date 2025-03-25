import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  primarySwatch: Colors.indigo,
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
);

ThemeData darkMode = ThemeData(
  primarySwatch: Colors.indigo,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.grey[900],
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.grey[900]),
    ),
  ),
);
