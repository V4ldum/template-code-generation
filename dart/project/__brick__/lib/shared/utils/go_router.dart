import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:{{project_name}}/shared/presentation/page/loading_page.dart';

@protected
final router = GoRouter(
  initialLocation: Routes._loadingPath,
  routes: [
    GoRoute(
      name: Routes.loading,
      path: Routes._loadingPath,
      builder: (_, __) => const LoadingPage(),
      routes: [
        //
      ],
    ),
  ],
);

class Routes {
  Routes._();

  static const String loading = 'loading';
  static const String _loadingPath = '/';
}
