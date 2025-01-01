import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'app_state.dart';

class AppCubit extends HydratedCubit<AppState> {
  AppCubit() : super(AppState());

  void changeLocale(Locale locale) {
    emit(state.copyWith(locale: locale));
  }

  void changeThemeMode(ThemeMode themeMode) {
    emit(state.copyWith(themeMode: themeMode));
  }

  @override
  AppState fromJson(Map<String, dynamic> json) {
    try {
      return AppState.fromJson(json);
    } catch (error) {
      return AppState();
    }
  }

  @override
  Map<String, dynamic> toJson(AppState state) {
    return state.toJson();
  }
}
