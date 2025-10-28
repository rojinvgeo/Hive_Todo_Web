import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    colorSchemeSeed: Colors.teal,
    useMaterial3: true,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorSchemeSeed: Colors.tealAccent,
    useMaterial3: true,
  );
}
