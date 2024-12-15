part of 'app_cubit.dart';

class AppState {
  final Locale? locale;
  final ThemeMode? themeMode;

  AppState({
    this.locale,
    this.themeMode,
  });

  AppState copyWith({
    Locale? locale,
    ThemeMode? themeMode,
  }) {
    return AppState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
