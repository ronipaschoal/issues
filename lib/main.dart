import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:issues/config/cubit/app_cubit.dart';
import 'package:issues/routes.dart';
import 'package:issues/ui/ui_theme.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => AppCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) =>
          previous.locale != current.locale ||
          previous.themeMode != current.themeMode,
      builder: (_, state) {
        return MaterialApp.router(
          title: 'My Issues',
          debugShowCheckedModeBanner: false,
          locale: state.locale,
          themeMode: state.themeMode,
          theme: UiTheme.lightTheme,
          darkTheme: UiTheme.darkTheme,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('pt', 'BR'),
            Locale('en', 'US'),
            Locale('es', 'ES'),
          ],
          routerDelegate: Routes.config.routerDelegate,
          routeInformationParser: Routes.config.routeInformationParser,
          routeInformationProvider: Routes.config.routeInformationProvider,
        );
      },
    );
  }
}
