import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:issues/config/cubit/app_cubit.dart';
import 'package:issues/domain/models/locale_model.dart';
import 'package:issues/ui/ui_theme.dart';

class HomeMenuWidget extends StatelessWidget {
  final AppCubit appCubit;

  const HomeMenuWidget({
    super.key,
    required this.appCubit,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(UiTheme.spacingMedium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: UiTheme.spacingMedium,
        children: [
          BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              return Row(
                children: [
                  const CircleAvatar(child: Icon(Icons.person)),
                  UiTheme.spacerMedium,
                  Text(state.loggedUser),
                ],
              );
            },
          ),
          UiTheme.spacerSmallX,
          if (Theme.of(context).brightness == Brightness.light) ...{
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
              ),
              onPressed: () => appCubit.changeThemeMode(ThemeMode.dark),
              icon: const Icon(Icons.dark_mode_outlined),
              label: Text(AppLocalizations.of(context)!.darkMode),
            ),
          } else ...{
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
              ),
              onPressed: () => appCubit.changeThemeMode(ThemeMode.light),
              icon: const Icon(Icons.light_mode_outlined),
              label: Text(AppLocalizations.of(context)!.lightMode),
            ),
          },
          if (Localizations.localeOf(context) == LocaleEnum.pt.locale) ...{
            ElevatedButton.icon(
              onPressed: () => appCubit.changeLocale(LocaleEnum.en.locale),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
              ),
              label: Text(LocaleEnum.en.translate(context)),
              icon: const Icon(Icons.language),
            ),
          } else ...{
            ElevatedButton.icon(
              onPressed: () => appCubit.changeLocale(LocaleEnum.pt.locale),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                alignment: Alignment.centerLeft,
              ),
              label: Text(LocaleEnum.pt.translate(context)),
              icon: const Icon(Icons.language),
            ),
          },
        ],
      ),
    );
  }
}
