import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainInitialState(themeMode: ThemeMode.system)) {
    on<ChangeThemeMainEvent>(changeTheme);
  }

  void changeTheme(ChangeThemeMainEvent event, Emitter emit) {
    emit(ChangeThemeModeState(themeMode: event.themeMode));
  }
}
