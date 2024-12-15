import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:issues/config/cubit/app_cubit.dart';
import 'package:issues/domain/models/locale_model.dart';

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
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
            actions: [
              IconButton(
                icon: state.themeMode == ThemeMode.light
                    ? const Icon(Icons.dark_mode_outlined)
                    : const Icon(Icons.light_mode_outlined),
                onPressed: appCubit.toggleThemeMode,
              ),
              if (Localizations.localeOf(context) == LocaleEnum.pt.locale) ...{
                TextButton(
                  onPressed: () => appCubit.changeLocale(LocaleEnum.en.locale),
                  child: Text(LocaleEnum.en.text),
                ),
              } else ...{
                TextButton(
                  onPressed: () => appCubit.changeLocale(LocaleEnum.pt.locale),
                  child: Text(LocaleEnum.pt.text),
                ),
              },
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: body,
          ),
        );
      },
    );
  }
}
