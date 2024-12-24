import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:issues/config/cubit/app_cubit.dart';
import 'package:issues/domain/models/locale_model.dart';
import 'package:issues/domain/models/theme_model.dart';
import 'package:issues/routes.dart';
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
                padding: const EdgeInsets.all(UiTheme.spacingMedium),
                alignment: Alignment.centerLeft,
              ),
              onPressed: () => appCubit.changeThemeMode(ThemeEnum.dark.theme),
              icon: ThemeEnum.dark.icon,
              label: Text(ThemeEnum.dark.translate(context)),
            ),
          } else ...{
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(UiTheme.spacingMedium),
                alignment: Alignment.centerLeft,
              ),
              onPressed: () => appCubit.changeThemeMode(ThemeEnum.light.theme),
              icon: ThemeEnum.light.icon,
              label: Text(ThemeEnum.light.translate(context)),
            ),
          },
          ElevatedButton.icon(
            onPressed: () => _changeLocale(context),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(UiTheme.spacingMedium),
              alignment: Alignment.centerLeft,
            ),
            label: Text(
              LocaleEnum.values.firstWhere((locale) {
                return locale.locale == Localizations.localeOf(context);
              }).translate(context),
            ),
            icon: const Icon(Icons.language),
          ),
        ],
      ),
    );
  }

  void _changeLocale(BuildContext context) {
    showModalBottomSheet(
      enableDrag: true,
      useSafeArea: true,
      context: context,
      builder: (context) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(UiTheme.spacingLarge),
          itemCount: LocaleEnum.values.length,
          itemBuilder: (context, index) => ElevatedButton.icon(
            onPressed: () {
              appCubit.changeLocale(LocaleEnum.values[index].locale);
              Routes.pop();
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(UiTheme.spacingMedium),
              alignment: Alignment.centerLeft,
            ),
            label: Text(LocaleEnum.values[index].translate(context)),
            icon: const Icon(Icons.language),
          ),
        );
      },
    );
  }
}
