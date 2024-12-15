import 'package:flutter/material.dart';

sealed class UiTheme {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF96416A),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFFFD8E6),
      onPrimaryContainer: Color(0xFF3D0024),
      secondary: Color(0xFF735761),
      onSecondary: Color(0xFFFFFFFF),
      error: Color(0xFFB00020),
      onError: Color(0xFFFFFFFF),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF000000),
    ),
    brightness: Brightness.light,
  );

  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFFFB0D0),
      onPrimary: Color(0xFF5C113B),
      primaryContainer: Color(0xFF792952),
      onPrimaryContainer: Color(0xFFFFD8E6),
      secondary: Color(0xFFE1BDCA),
      onSecondary: Color(0xFF412A33),
      error: Color(0xFFCF6679),
      onError: Color(0xFF000000),
      surface: Color(0xFF121212),
      onSurface: Color(0xFFFFFFFF),
    ),
    brightness: Brightness.dark,
  );
}
