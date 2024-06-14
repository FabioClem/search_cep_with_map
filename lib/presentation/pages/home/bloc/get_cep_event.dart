part of 'get_cep_bloc.dart';

@immutable
sealed class GetCepEvent {}

final class FetchCepEvent extends GetCepEvent {
  final String cep;
  FetchCepEvent({required this.cep});
}

final class OpenMapEvent extends GetCepEvent {
  final String latitude;
  final String longitude;
  OpenMapEvent({
    required this.latitude,
    required this.longitude,
  });
}

final class ChangeThemeEvent extends GetCepEvent {
  final BuildContext context;
  final bool isDarkTheme;
  ChangeThemeEvent({required this.context, required this.isDarkTheme});
}
