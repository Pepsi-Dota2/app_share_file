
import 'package:auto_route/auto_route.dart';

import 'routers.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: LoginRoute.page , initial: true),
        AutoRoute(page: IntroduceRoute.page),
        AutoRoute(page: RegisterRoute.page),
      ];
}
