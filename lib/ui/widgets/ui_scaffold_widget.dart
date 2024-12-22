import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:issues/config/cubit/app_cubit.dart';
import 'package:issues/domain/models/locale_model.dart';
import 'package:issues/ui/ui_theme.dart';
import 'package:issues/ui/widgets/flutter_banner_widget.dart';

class UiScaffoldWidget extends StatelessWidget {
  final String title;
  final Widget body;

  const UiScaffoldWidget({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<AppCubit>();

    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return FlutterBannerWidget(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor:
                  Theme.of(context).colorScheme.primary.withAlpha(40),
              surfaceTintColor: Colors.transparent,
              title: Text(
                title,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              actions: [
                if (Theme.of(context).brightness == Brightness.light) ...{
                  ElevatedButton.icon(
                    onPressed: appCubit.toggleThemeMode,
                    label: const Icon(Icons.dark_mode_outlined),
                  ),
                } else ...{
                  ElevatedButton.icon(
                    onPressed: appCubit.toggleThemeMode,
                    label: const Icon(Icons.light_mode_outlined),
                  ),
                },
                UiTheme.spacerSmallX,
                if (Localizations.localeOf(context) ==
                    LocaleEnum.pt.locale) ...{
                  ElevatedButton(
                    onPressed: () =>
                        appCubit.changeLocale(LocaleEnum.en.locale),
                    child: Text(LocaleEnum.en.text),
                  ),
                } else ...{
                  ElevatedButton(
                    onPressed: () =>
                        appCubit.changeLocale(LocaleEnum.pt.locale),
                    child: Text(LocaleEnum.pt.text),
                  ),
                },
                UiTheme.spacerSmallX,
              ],
            ),
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomLeft,
                  stops: const [
                    0.1,
                    0.5,
                    0.9,
                  ],
                  colors: [
                    Theme.of(context).colorScheme.primary.withAlpha(40),
                    Theme.of(context).colorScheme.surface.withAlpha(30),
                    Theme.of(context).colorScheme.primary.withAlpha(30),
                  ],
                ),
              ),
              child: SafeArea(child: body),
            ),
          ),
        );
      },
    );
  }
}
