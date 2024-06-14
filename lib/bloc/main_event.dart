part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}

final class ChangeThemeMainEvent extends MainEvent {
  final ThemeMode themeMode;
  ChangeThemeMainEvent({required this.themeMode});
}
