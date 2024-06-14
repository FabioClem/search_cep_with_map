part of 'main_bloc.dart';

@immutable
sealed class MainState {
  final ThemeMode themeMode;
  const MainState({required this.themeMode});
}

final class MainInitialState extends MainState {
  const MainInitialState({required super.themeMode});
}

final class ChangeThemeModeState extends MainState {
  const ChangeThemeModeState({required super.themeMode});
}
