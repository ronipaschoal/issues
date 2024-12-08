import 'package:flutter/material.dart';
import 'package:issues/models/locale_model.dart';

class MiLocaleButtonWidget extends StatelessWidget {
  final ValueChanged<Locale> changeLocale;

  const MiLocaleButtonWidget({
    super.key,
    required this.changeLocale,
  });

  @override
  Widget build(BuildContext context) {
    if (Localizations.localeOf(context) == LocaleEnum.pt.locale) {
      return TextButton(
        onPressed: () => changeLocale(LocaleEnum.en.locale),
        child: Text(
          LocaleEnum.en.text,
        ),
      );
    }
    return TextButton(
      onPressed: () => changeLocale(LocaleEnum.pt.locale),
      child: Text(
        LocaleEnum.pt.text,
      ),
    );
  }
}
