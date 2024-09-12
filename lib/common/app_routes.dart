import 'package:go_router/go_router.dart';

import '../core/error/error_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/intro/presentation/pages/intro_page.dart';
import '../features/splash/presentation/pages/splash_page.dart';

class AppRoutes {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (final context, final state) {
          return const SplashScreen(); // Set SplashScreen as initial route
        },
        routes: [
          GoRoute(
            path: 'home',
            builder: (final context, final state) {
              return const HomePage();
            },
          ),
          GoRoute(
            path: 'intro',
            builder: (final context, final state) {
              return const IntroPage();
            },
          ),
        ],
      ),
      GoRoute(
        path: '/error',
        builder: (final context, final state) {
          final errorMessage =
              state.uri.queryParameters['errorMessage'] ?? 'Unknown error';
          final errorCode =
              int.tryParse(state.uri.queryParameters['errorCode'] ?? '');
          final onRetry = () {
            // Implement retry logic here if needed
          };
          return ErrorPage(
            errorMessage: errorMessage,
            errorCode: errorCode,
            onRetry: onRetry,
          );
        },
      ),
    ],
    errorBuilder: (final context, final state) {
      final errorMessage = state.error.toString();
      return ErrorPage(
        errorMessage: errorMessage,
        onRetry: () {
          // Implement retry logic here if needed
        },
      );
    },
  );
}
