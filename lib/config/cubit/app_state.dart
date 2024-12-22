part of 'app_cubit.dart';

class AppState {
  final Locale? locale;
  final ThemeMode themeMode;
  final String loggedUser;
  AppState({
    this.locale,
    this.themeMode = ThemeMode.system,
    this.loggedUser = 'Roni Paschoal',
  });

  AppState copyWith({
    Locale? locale,
    ThemeMode? themeMode,
    String? loggedUser,
  }) {
    return AppState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
      loggedUser: loggedUser ?? this.loggedUser,
    );
  }
}
