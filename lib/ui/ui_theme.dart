import 'package:flutter/material.dart';

sealed class UiTheme {
  static const double fontSizeLarge = 18.0;
  static const double fontSizeMedium = 16.0;
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

  static const Color primaryColor = Color(0xFF1B6A7C);
  static const Color primaryColorMedium = Color(0x881B6A7C);
  static const Color primaryColorBright = Color(0x221B6A7C);

  static const Color textColor = Color(0xFF212121);
  static const Color textColorMedium = Color(0xBB212121);
  static const Color textColorBright = Color(0x88212121);

  static final theme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: UiTheme.primaryColor,
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFF11434E),
      onPrimaryContainer: Color(0xFFFCF8FA),
      secondary: Color(0xFF0F8080),
      onSecondary: Color(0xFFFFFFFF),
      error: Color(0xFFB00020),
      onError: Color(0xFFFFFFFF),
      surface: Color(0xFFF7F7F7),
      onSurface: Color(0xFF000000),
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: UiTheme.fontSizeSmall,
        color: UiTheme.textColorBright,
      ),
      bodyMedium: TextStyle(
        fontSize: UiTheme.fontSizeMedium,
        color: UiTheme.textColorMedium,
      ),
      bodyLarge: TextStyle(
        fontSize: UiTheme.fontSizeLarge,
        color: UiTheme.textColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: TextButton.styleFrom(
        elevation: 0.0,
        padding: const EdgeInsets.all(UiTheme.spacingMedium),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: const TextStyle(
        color: UiTheme.primaryColor,
        fontSize: UiTheme.fontSizeSmall,
      ),
      labelStyle: const TextStyle(
        fontSize: UiTheme.fontSizeMedium,
        color: UiTheme.textColorMedium,
      ),
      hintStyle: const TextStyle(
        fontSize: UiTheme.fontSizeMedium,
        color: UiTheme.textColorMedium,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          width: 2.0,
          color: UiTheme.primaryColorBright,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          width: 2.0,
          color: UiTheme.primaryColorBright,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(
          width: 2.0,
          color: UiTheme.primaryColor,
        ),
      ),
    ),
  );
}

sealed class UiThemeDark {
  static const Color primaryColor = Color(0xFF35D0F2);
  static const Color primaryColorMedium = Color(0x8835D0F2);
  static const Color primaryColorBright = Color(0x2235D0F2);

  static const Color textColor = Color(0xFFF4F4F4);
  static const Color textColorMedium = Color(0xBBF4F4F4);
  static const Color textColorBright = Color(0x88F4F4F4);

  static final textTheme = UiTheme.theme.textTheme;
  static final inputDecorationTheme = UiTheme.theme.inputDecorationTheme;

  static final theme = UiTheme.theme.copyWith(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF000000),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: primaryColor,
      onPrimary: Color(0xFF5C113B),
      primaryContainer: Color(0xFF248CA3),
      onPrimaryContainer: Color(0xFFFFD8E6),
      secondary: Color(0xFF1DF2F2),
      onSecondary: Color(0xFF412A33),
      error: Color(0xFFCF6679),
      onError: Color(0xFF000000),
      surface: Color(0xFF101415),
      onSurface: Color(0xFFFFFFFF),
    ),
    textTheme: TextTheme(
      bodySmall: textTheme.bodySmall!.copyWith(color: textColorBright),
      bodyMedium: textTheme.bodyMedium!.copyWith(color: textColorBright),
      bodyLarge: textTheme.bodyLarge!.copyWith(color: textColorBright),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: inputDecorationTheme.floatingLabelStyle! //
          .copyWith(color: primaryColor),
      labelStyle: inputDecorationTheme.labelStyle! //
          .copyWith(color: textColorMedium),
      hintStyle: inputDecorationTheme.hintStyle! //
          .copyWith(color: textColorMedium),
      border: inputDecorationTheme.border!.copyWith(
        borderSide: inputDecorationTheme.border!.borderSide
            .copyWith(color: primaryColorBright),
      ),
      enabledBorder: inputDecorationTheme.enabledBorder!.copyWith(
        borderSide: inputDecorationTheme.enabledBorder!.borderSide
            .copyWith(color: primaryColorBright),
      ),
      focusedBorder: inputDecorationTheme.focusedBorder!.copyWith(
        borderSide: inputDecorationTheme.focusedBorder!.borderSide
            .copyWith(color: primaryColor),
      ),
    ),
  );
}
