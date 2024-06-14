import 'package:flutter/material.dart';
import 'package:flutter_application_clean/core/dependencies/init_dependencies.dart';
import 'package:flutter_application_clean/presentation/pages/home/bloc/get_cep_bloc.dart';
import 'package:flutter_application_clean/presentation/pages/home/home_page.dart';
import 'package:flutter_application_clean/presentation/pages/map/map_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final class RoutesName {
  static const String home = '/home';
  static const String map = '/map';
}

final Map<String, WidgetBuilder> routes = {
  RoutesName.home: (context) => BlocProvider(
        create: (context) => GetCepBloc(
          getCepUsecase: instanceGetIt(),
        ),
        child: const HomePage(),
      ),
  RoutesName.map: (context) => const MapPage(),
};
