import 'dart:ui';

enum LocaleEnum {
  en('EN', Locale('en', 'US')),
  pt('PT', Locale('pt', 'BR'));

  const LocaleEnum(this.text, this.locale);

  final String text;
  final Locale locale;
}
