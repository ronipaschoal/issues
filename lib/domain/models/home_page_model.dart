import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension HomePageExtension on HomePageEnum {
  String translate(BuildContext context) {
    return switch (this) {
      HomePageEnum.issueList => AppLocalizations.of(context)!.issues,
      HomePageEnum.newIssue => AppLocalizations.of(context)!.newIssue,
      HomePageEnum.menu => '',
    };
  }
}

enum HomePageEnum { issueList, newIssue, menu }
