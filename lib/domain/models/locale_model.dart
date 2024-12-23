import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocaleEnumExtension on LocaleEnum {
  String translate(BuildContext context) {
    return switch (this) {
      LocaleEnum.en => AppLocalizations.of(context)!.english,
      LocaleEnum.pt => AppLocalizations.of(context)!.portuguese,
    };
  }
}

enum LocaleEnum {
  en('EN', Locale('en', 'US')),
  pt('PT', Locale('pt', 'BR'));

  const LocaleEnum(this.text, this.locale);

  final String text;
  final Locale locale;
}
