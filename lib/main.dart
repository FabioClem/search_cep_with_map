import 'package:flutter/material.dart';
import 'package:flutter_application_clean/bloc/main_bloc.dart';
import 'package:flutter_application_clean/core/dependencies/init_dependencies.dart';
import 'package:flutter_application_clean/core/routes/routes.dart';
import 'package:flutter_application_clean/core/theme/color_scheme.dart';
import 'package:flutter_application_clean/core/theme/system_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter application',
            routes: routes,
            initialRoute: RoutesName.home,
            theme: SystemTheme.theme(lightColorScheme),
            darkTheme: SystemTheme.theme(darkColorScheme),
            themeMode: state.themeMode,
          );
        },
      ),
    );
  }
}
