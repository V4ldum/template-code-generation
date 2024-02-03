import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name}}/shared/presentation/page/loading_page.dart';

@protected
final router = GoRouter(
  initialLocation: AppRoute._loadingPath,
  routes: [
    GoRoute(
      name: AppRoute.loading,
      path: AppRoute._loadingPath,
      builder: (_, __) => const LoadingPage(),
      routes: [
        //
      ],
    ),
  ],
);

class AppRoute {
  AppRoute._();

  static const String loading = 'loading';
  static const String _loadingPath = '/';
}
