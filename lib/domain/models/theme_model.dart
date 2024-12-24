import 'package:flutter/material.dart';
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
    Icon(Icons.light_mode_outlined),
  ),
  dark(
    ThemeMode.dark,
    Icon(Icons.dark_mode_outlined),
  );

  const ThemeEnum(this.theme, this.icon);

  final ThemeMode theme;
  final Icon icon;
}
