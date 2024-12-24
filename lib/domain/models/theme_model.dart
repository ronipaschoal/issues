import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ThemeEnumExtension on ThemeEnum {
  String translate(BuildContext context) {
    return switch (this) {
      ThemeEnum.light => AppLocalizations.of(context)!.lightMode,
      ThemeEnum.dark => AppLocalizations.of(context)!.darkMode,
    };
  }
}

enum ThemeEnum {
  light(
    ThemeMode.light,
    Brightness.light,
    Icon(Icons.light_mode_outlined),
    SystemUiOverlayStyle.dark,
  ),
  dark(
    ThemeMode.dark,
    Brightness.dark,
    Icon(Icons.dark_mode_outlined),
    SystemUiOverlayStyle.light,
  );

  const ThemeEnum(
    this.theme,
    this.brightness,
    this.icon,
    this.systemUiOverlayStyle,
  );

  final ThemeMode theme;
  final Brightness brightness;
  final Icon icon;
  final SystemUiOverlayStyle systemUiOverlayStyle;
}
