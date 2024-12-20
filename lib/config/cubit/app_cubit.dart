import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  void changeLocale(Locale locale) {
    emit(state.copyWith(locale: locale));
  }

  void toggleThemeMode() {
    final themeMode = state.themeMode == ThemeMode.light //
        ? ThemeMode.dark
        : ThemeMode.light;

    emit(state.copyWith(themeMode: themeMode));
  }
}
