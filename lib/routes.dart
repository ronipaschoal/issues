import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:issues/pages/home/home_route.dart';

sealed class Routes {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  // static final _shellNavigatorKey = GlobalKey<NavigatorState>();

  static const String home = HomeRoute.path;

  static final List<RouteBase> _routes = [
    HomeRoute.route(_rootNavigatorKey),
  ];

  static final config = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: home,
    routes: _routes,
    redirect: _redirectPolicy,
  );

  static Future<String?> _redirectPolicy(
    BuildContext context,
    GoRouterState state,
  ) async {
    return null;
  }

  static void popToRoot() {
    while (config.canPop()) {
      config.pop();
    }
  }

  static void popUntil(String route) {
    while (!config.location.startsWith(route) && config.canPop()) {
      config.pop();
    }
  }
}
