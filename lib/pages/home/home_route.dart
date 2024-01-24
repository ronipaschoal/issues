import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:issues/pages/home/home_page.dart';

sealed class HomeRoute {
  static const String path = '/home';

  static GoRoute route([GlobalKey<NavigatorState>? parentNavigatorKey]) {
    return GoRoute(
      parentNavigatorKey: parentNavigatorKey,
      path: path,
      builder: (context, state) => const HomePage(),
    );
  }
}
