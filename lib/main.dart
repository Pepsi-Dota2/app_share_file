import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:app_share_file/src/core/config/di/config_dependencies.dart';
import 'package:app_share_file/src/core/constant/theme/theme.dart';
import 'package:app_share_file/src/core/constant/translate.dart';
import 'package:app_share_file/src/core/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  await configDependencies();
  runApp(
    EasyLocalization(
        supportedLocales: SupportedLocale.locales,
        path: 'assets/translations', // Path to your translation files
        fallbackLocale: Locale('en'), // Fallback locale
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: GarbageTheme.lightTheme,
      dark: GarbageTheme.darkTheme,
      initial: AdaptiveThemeMode.light,
      builder: (theme, lightTheme) => MaterialApp.router(
        title: 'Adaptive Theme Demo',
        theme: lightTheme,
        darkTheme: GarbageTheme.darkTheme,
        routerDelegate: _appRouter.delegate(),
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        routeInformationParser: _appRouter.defaultRouteParser(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
