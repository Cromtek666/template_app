import 'package:go_router/go_router.dart';
import 'package:template_app/features/home/presentation/pages/home_page.dart';

class AppRoutes {
  final router = GoRouter(routes: [
    GoRoute(
        path: '/',
        builder: (final context, final state) {
          return const HomePage();
        })
  ]);
}
