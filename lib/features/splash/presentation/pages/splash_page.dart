import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A FutureProvider to handle the state of whether the intro has been seen.
///
/// This provider retrieves the 'intro_seen' flag from shared preferences to determine
/// if the intro screen should be displayed or not.
final introSeenFutureProvider = FutureProvider<bool>((final ref) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('intro_seen') ?? false;
});

/// `SplashScreen` is a ConsumerWidget that displays a splash screen while determining
/// if the intro has been seen. Based on this state, it navigates to the appropriate
/// screen (home or intro).
class SplashScreen extends ConsumerWidget {
  /// Creates an instance of `SplashScreen`.
  ///
  /// @param key An optional key to identify the widget.
  const SplashScreen({super.key});

  @override
  Widget build(final BuildContext context, final WidgetRef ref) {
    // Watch the FutureProvider
    final introSeenAsyncValue = ref.watch(introSeenFutureProvider);

    return Scaffold(
      body: SafeArea(
        child: introSeenAsyncValue.when(
          /// When the data is available, navigate to the appropriate screen.
          data: (final bool introSeen) {
            WidgetsBinding.instance.addPostFrameCallback((final _) {
              if (introSeen) {
                context.go('/home');

                ///< Navigate to the home screen if intro has been seen.
              } else {
                context.go('/intro');

                ///< Navigate to the intro screen if intro has not been seen.
              }
            });
            return Container();

            ///< Return an empty container as the page will be replaced.
          },

          /// Show a loading indicator while the data is being fetched.
          loading: () => const Center(
            child: GFLoader(
              type: GFLoaderType.ios,
              loaderColorOne: Colors.blue,
            ),
          ),

          /// Display an error message if there is an error retrieving the data.
          error: (final error, final stackTrace) {
            return Center(
              child: Text('Error: $error'),
            );
          },
        ),
      ),
    );
  }
}
