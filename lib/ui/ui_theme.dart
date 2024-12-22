import 'package:flutter/material.dart';

sealed class UiTheme {
  static const double fontSizeLarge = 44.0;
  static const double fontSizeMedium = 24.0;
  static const double fontSizeRegular = 16.0;
  static const double fontSizeSmall = 14.0;

  static const double spacingSmallX = 4.0;
  static const double spacingSmall = 8.0;
  static const double spacingMedium = 16.0;
  static const double spacingLarge = 32.0;
  static const double spacingLargeX = 64.0;

  static const SizedBox spacerSmallX =
      SizedBox(height: spacingSmallX, width: spacingSmallX);
  static const SizedBox spacerSmall =
      SizedBox(height: spacingSmall, width: spacingSmall);
  static const SizedBox spacerMedium =
      SizedBox(height: spacingMedium, width: spacingMedium);
  static const SizedBox spacerLarge =
      SizedBox(height: spacingLarge, width: spacingLarge);
  static const SizedBox spacerLargeX =
      SizedBox(height: spacingLargeX, width: spacingLargeX);

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF1B6A7C),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFFFD8E6),
      onPrimaryContainer: Color.fromARGB(255, 252, 248, 250),
      secondary: Color(0xFF0F8080),
      onSecondary: Color(0xFFFFFFFF),
      error: Color(0xFFB00020),
      onError: Color(0xFFFFFFFF),
      surface: Color(0xFFF7F7F7),
      onSurface: Color(0xFF000000),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(spacingSmallX),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 0.0,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF000000),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF35D0F2),
      onPrimary: Color(0xFF5C113B),
      primaryContainer: Color(0xFF792952),
      onPrimaryContainer: Color(0xFFFFD8E6),
      secondary: Color(0xFF1DF2F2),
      onSecondary: Color(0xFF412A33),
      error: Color(0xFFCF6679),
      onError: Color(0xFF000000),
      surface: Color(0xFF101415),
      onSurface: Color(0xFFFFFFFF),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(spacingSmallX),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 0.0,
      ),
    ),
  );
}
