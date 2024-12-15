import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:issues/config/cubit/app_cubit.dart';
import 'package:issues/data/repositories/issues/issues_repository.dart';
import 'package:issues/data/services/issues_services.dart';
import 'package:issues/pages/home/cubit/home_cubit.dart';
import 'package:issues/pages/home/home_page.dart';

sealed class HomeRoute {
  static const String path = '/home';

  static GoRoute route([GlobalKey<NavigatorState>? parentNavigatorKey]) {
    return GoRoute(
      parentNavigatorKey: parentNavigatorKey,
      path: path,
      builder: (context, state) => BlocProvider(
        create: (context) => HomeCubit(
          IssuesRepository(IssuesServices()),
        )..getIssues(),
        child: HomePage(
          appCubit: context.read<AppCubit>(),
        ),
      ),
    );
  }
}
