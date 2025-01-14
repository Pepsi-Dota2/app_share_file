import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:app_share_file/src/core/config/di/config_dependencies.dart';
import 'package:app_share_file/src/core/constant/theme/theme.dart';
import 'package:app_share_file/src/core/router/routers.dart';
import 'package:flutter/material.dart';

void main() async {
  await configDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: GarbageTheme.lightTheme,
      dark: GarbageTheme.darkTheme,
      initial: AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => MaterialApp.router(
        title: 'Adaptive Theme Demo',
        theme: theme,
        darkTheme: darkTheme,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
