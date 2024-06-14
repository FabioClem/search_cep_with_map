part of 'get_cep_bloc.dart';

@immutable
sealed class GetCepState {
  final CepModel? cepModel;
  final bool isDarkTheme;

  const GetCepState({this.cepModel, this.isDarkTheme = true});
}

final class GetCepInitialState extends GetCepState {
  const GetCepInitialState();
}

final class GetCepLoadingState extends GetCepState {
  const GetCepLoadingState();
}

final class GetCepSuccessState extends GetCepState {
  const GetCepSuccessState({required super.cepModel});
}

final class GetCepErrorState extends GetCepState {
  final ResponseError error;
  const GetCepErrorState({required super.cepModel, required this.error});
}

final class ChangeThemeState extends GetCepState {
  const ChangeThemeState({required super.isDarkTheme});
}
