import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// `LocaleNotifier` manages the state for the current locale (language) of the app.
/// It saves and loads the locale from shared preferences for persistence.
class LocaleNotifier extends StateNotifier<Locale> {
  /// Constructor for `LocaleNotifier`.
  /// Initializes the state with the default locale ('en') and loads the saved locale if available.
  LocaleNotifier() : super(const Locale('en')) {
    _init();

    ///< Initializes the locale asynchronously.
  }

  /// Initializes the async operation to load the saved locale.
  Future<void> _init() async {
    await _loadLocale();

    ///< Loads the saved locale from shared preferences.
  }

  /// Loads the locale from shared preferences.
  ///
  /// If no locale is saved, it defaults to 'en'.
  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString('language_code') ?? 'en';

    ///< Retrieves the saved language code or defaults to 'en'.
    state = Locale(languageCode);

    ///< Updates the state with the loaded or default locale.
  }

  /// Updates the locale and saves it to shared preferences.
  ///
  /// @param locale The new locale to save.
  Future<void> setLocale(final Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', locale.languageCode);

    ///< Persists the new locale in shared preferences.
    state = locale;

    ///< Updates the state with the new locale.
  }
}

/// Provides the `LocaleNotifier` for Riverpod state management.
///
/// This allows the locale state to be shared and watched across the app.
final localeNotifierProvider = StateNotifierProvider<LocaleNotifier, Locale>(
  (final ref) {
    return LocaleNotifier();

    ///< Returns an instance of `LocaleNotifier`.
  },
);
