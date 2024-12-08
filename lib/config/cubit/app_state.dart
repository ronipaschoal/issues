part of 'app_cubit.dart';

class AppState {
  final Locale? locale;

  AppState({this.locale});

  AppState copyWith({Locale? locale}) {
    return AppState(locale: locale ?? this.locale);
  }
}
