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

  factory AppState.fromJson(Map<String, dynamic> json) {
    return AppState(
      locale: json['locale'] != null ? Locale(json['locale']) : null,
      themeMode: json['themeMode'] != null
          ? ThemeMode.values.firstWhere(
              (theme) => theme.toString() == json['themeMode'],
              orElse: () => ThemeMode.system,
            )
          : ThemeMode.system,
      loggedUser: json['loggedUser'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'locale': locale?.languageCode,
      'themeMode': themeMode.toString(),
      'loggedUser': loggedUser,
    };
  }
}
