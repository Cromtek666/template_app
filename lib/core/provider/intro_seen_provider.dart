import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// `IntroSeenNotifier` manages the state for whether the intro has been seen or not.
/// This state is stored in shared preferences for persistence.
class IntroSeenNotifier extends StateNotifier<bool> {
  /// Constructor for `IntroSeenNotifier`.
  /// Initializes the state by loading the persisted intro status.
  IntroSeenNotifier() : super(false) {
    unawaited(_init());
  }

  /// Initializes the async operation to load the intro status.
  ///
  /// This separates the async operation from the constructor.
  Future<void> _init() async {
    await _loadIntroSeen();

    ///< Loads the intro seen status from shared preferences.
  }

  /// Updates the intro seen status and saves it to shared preferences.
  ///
  /// @param value The new intro seen status to save.
  Future<void> setIntroSeen(final bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('intro_seen', value);

    ///< Persists the new status in shared preferences.
    state = value;

    ///< Updates the state.
  }

  /// Loads the intro seen status from shared preferences.
  ///
  /// If the status is not set, it defaults to `false`.
  Future<void> _loadIntroSeen() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getBool('intro_seen') ?? false;

    ///< Loads or defaults to `false`.
  }
}

/// Provides the `IntroSeenNotifier` for Riverpod state management.
///
/// This allows the state to be shared and watched across the app.
final introSeenProvider = StateNotifierProvider<IntroSeenNotifier, bool>(
  (final ref) {
    return IntroSeenNotifier();

    ///< Returns an instance of `IntroSeenNotifier`.
  },
);
