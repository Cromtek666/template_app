import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../common/app_themes.dart';

/// `ThemeNotifier` manages the state for the current theme of the app.
/// It provides functionality to load, update, and persist the theme using shared preferences.
class ThemeNotifier extends StateNotifier<ThemeData> {
  /// Constructor for `ThemeNotifier`.
  /// Initializes the state with the light theme and loads the saved theme asynchronously.
  ThemeNotifier() : super(AppThemes.lightTheme) {
    Future.microtask(() async => _loadTheme());

    ///< Loads the saved theme asynchronously.
  }

  /// Loads the theme from shared preferences.
  ///
  /// If no theme is saved, it defaults to 'Light Theme'.
  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final String? themeName = prefs.getString('theme_mode');

    ///< Retrieves the saved theme name or defaults to 'Light Theme'.
    state = _mapThemeNameToThemeData(themeName ?? 'Light Theme');

    ///< Updates the state with the loaded or default theme.
  }

  /// Maps a theme name to the corresponding `ThemeData`.
  ///
  /// @param themeName The name of the theme to map.
  /// @return The corresponding `ThemeData` object.
  ThemeData _mapThemeNameToThemeData(final String themeName) {
    switch (themeName) {
      case 'Dark Theme':
        return AppThemes.darkTheme;
      case 'High Contrast':
        return AppThemes.highContrastTheme;
      case 'Older People':
        return AppThemes.olderPeopleTheme;
      case 'Light Theme':
      default:
        return AppThemes.lightTheme;
    }
  }

  /// Sets the theme and saves it to shared preferences.
  ///
  /// @param theme The `ThemeData` object to set.
  Future<void> setTheme(final ThemeData theme) async {
    state = theme;

    ///< Updates the state with the new theme.
    final prefs = await SharedPreferences.getInstance();
    final themeName = _mapThemeDataToThemeName(theme);

    ///< Maps the `ThemeData` to the theme name.
    await prefs.setString('theme_mode', themeName);

    ///< Persists the theme name in shared preferences.
  }

  /// Maps `ThemeData` back to the corresponding theme name.
  ///
  /// @param themeData The `ThemeData` to map.
  /// @return The name of the theme.
  String _mapThemeDataToThemeName(final ThemeData themeData) {
    if (themeData == AppThemes.darkTheme) {
      return 'Dark Theme';
    } else if (themeData == AppThemes.highContrastTheme) {
      return 'High Contrast';
    } else if (themeData == AppThemes.olderPeopleTheme) {
      return 'Older People';
    } else {
      return 'Light Theme';
    }
  }
}

/// Provides the `ThemeNotifier` for Riverpod state management.
///
/// This allows the theme state to be shared and watched across the app.
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, ThemeData>(
  (final ref) {
    return ThemeNotifier();

    ///< Returns an instance of `ThemeNotifier`.
  },
);
