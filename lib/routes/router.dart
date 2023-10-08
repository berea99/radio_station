import 'package:auto_route/auto_route.dart';
import 'package:radio_station/routes/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: null)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
            page: RadioStationsScreenWithCubitRoute.page,
            path: '/',
            fullscreenDialog: true),
        AutoRoute(page: RadioPlayerScreenRoute.page)
      ];
}
