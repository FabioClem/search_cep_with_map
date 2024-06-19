import 'package:flutter/material.dart';
import 'package:flutter_application_clean/bloc/main_bloc.dart';
import 'package:flutter_application_clean/core/errors/response_errors.dart';
import 'package:flutter_application_clean/core/utils/laucher.dart';
import 'package:flutter_application_clean/data/models/cep_model.dart';
import 'package:flutter_application_clean/domain/usecases/get_cep_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_cep_event.dart';
part 'get_cep_state.dart';

class GetCepBloc extends Bloc<GetCepEvent, GetCepState> {
  final GetCepUsecase _getCepUsecase;

  GetCepBloc({required GetCepUsecase getCepUsecase})
      : _getCepUsecase = getCepUsecase,
        super(const GetCepInitialState()) {
    on<FetchCepEvent>(_getCep);
    on<OpenMapEvent>(_openMap);
    on<ChangeThemeEvent>(_changeTheme);
  }

  void _getCep(FetchCepEvent event, Emitter emit) async {
    emit(const GetCepLoadingState());
    final parseCEPToNumber = int.parse(event.cep);
    final response = await _getCepUsecase(parseCEPToNumber);
    if (response.$1 != null) {
      emit(GetCepSuccessState(cepModel: response.$1));
    } else {
      emit(GetCepErrorState(cepModel: null, error: response.$2!));
    }
  }

  void _openMap(OpenMapEvent event, Emitter emit) {
    final double latitude = double.parse(event.latitude);
    final double longitude = double.parse(event.longitude);
    Laucher.openUrlMap(latitude, longitude);
  }

  void _changeTheme(ChangeThemeEvent event, Emitter emit) {
    MainBloc mainBloc = BlocProvider.of<MainBloc>(event.context);
    emit(ChangeThemeState(isDarkTheme: event.isDarkTheme));
    mainBloc.add(ChangeThemeMainEvent(
        themeMode: !event.isDarkTheme ? ThemeMode.light : ThemeMode.dark));
  }
}
