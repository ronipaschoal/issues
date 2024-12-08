import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:issues/config/cubit/app_cubit.dart';
import 'package:issues/ui/widgets/mi_locale_button_widget.dart';

class MiScaffold extends StatelessWidget {
  final String appBarTitle;
  final Widget child;

  const MiScaffold({
    super.key,
    required this.appBarTitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<AppCubit>();

    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) => previous.themeMode != current.themeMode,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(appBarTitle),
            actions: [
              IconButton(
                icon: state.themeMode == ThemeMode.light
                    ? const Icon(Icons.light_mode_outlined)
                    : const Icon(Icons.dark_mode_outlined),
                onPressed: appCubit.toggleThemeMode,
              ),
              MiLocaleButtonWidget(
                changeLocale: appCubit.changeLocale,
              ),
            ],
          ),
          body: child,
        );
      },
    );
  }
}
