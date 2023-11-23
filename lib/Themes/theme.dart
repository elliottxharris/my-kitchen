import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade200,
      outline: Colors.black,
      tertiary: Colors.grey.shade800,
    ));

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade800,
      outline: Colors.white,
      tertiary: Colors.grey.shade800,
    ));
