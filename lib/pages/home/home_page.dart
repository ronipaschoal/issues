import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:issues/config/cubit/app_cubit.dart';
import 'package:issues/ui/widgets/mi_locale_button_widget.dart';

class HomePage extends StatelessWidget {
  final AppCubit appCubit;

  const HomePage({
    super.key,
    required this.appCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(AppLocalizations.of(context)!.issues),
        actions: [
          MiLocaleButtonWidget(
            changeLocale: appCubit.changeLocale,
          ),
        ],
      ),
      body: Center(child: Text(AppLocalizations.of(context)!.hello)),
    );
  }
}
