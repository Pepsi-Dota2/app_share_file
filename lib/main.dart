import 'package:app_share_file/src/core/config/di/config_dependencies.dart';
import 'package:app_share_file/src/core/router/routers.dart';
import 'package:app_share_file/src/core/router/routers.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

void main ()async {
  await configDependencies();
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});
  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(
        deepLinkBuilder: (_) => const DeepLink([PageRouteInfo(LoginRoute.name)]),
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}