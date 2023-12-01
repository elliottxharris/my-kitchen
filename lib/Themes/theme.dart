import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.grey.shade200,
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    primary: Colors.black,
    inversePrimary: Colors.white,
    background: Colors.grey.shade200,
    outline: Colors.black,
    tertiary: Colors.grey.shade800,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade200,
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    elevation: 0
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.grey.shade800,
  useMaterial3: true,
  colorScheme: ColorScheme.dark(
    primary: Colors.white,
    inversePrimary: Colors.black,
    background: Colors.grey.shade800,
    outline: Colors.white,
    tertiary: Colors.grey.shade800,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade800,
    titleTextStyle: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    elevation: 0
  ),
);
