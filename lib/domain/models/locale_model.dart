import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocaleEnumExtension on LocaleEnum {
  String translate(BuildContext context) {
    return switch (this) {
      LocaleEnum.pt => AppLocalizations.of(context)!.portuguese,
      LocaleEnum.en => AppLocalizations.of(context)!.english,
      LocaleEnum.es => AppLocalizations.of(context)!.spanish,
    };
  }
}

enum LocaleEnum {
  pt('PT', Locale('pt', 'BR')),
  en('EN', Locale('en', 'US')),
  es('ES', Locale('es', 'ES'));

  const LocaleEnum(this.text, this.locale);

  final String text;
  final Locale locale;
}
