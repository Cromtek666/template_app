import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../common/app_themes.dart';
import '../../../../core/provider/intro_seen_provider.dart'; // Import the IntroSeenProvider
import '../../../../core/provider/locale_provider.dart';
import '../../../../core/provider/theme_provider.dart';
import '../../../../generated/l10n.dart';

/// The `HomePage` class is a ConsumerStatefulWidget that represents the main page of the app.
class HomePage extends ConsumerStatefulWidget {
  /// Constructor for the HomePage widget.
  const HomePage({super.key});

  @override
  _HomePage createState() => _HomePage();
}

/// The `_HomePage` class is the state for the `HomePage` widget.
/// It handles the UI building and manages state based on providers.
class _HomePage extends ConsumerState<HomePage> {
  /// Builds the main widget tree for the `HomePage`.
  @override
  Widget build(final BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),

        ///< Builds the app bar.
        drawer: _buildDrawer(context, ref),

        ///< Builds the navigation drawer.
        body: _buildBody(context),

        ///< Builds the main body content.
        bottomNavigationBar: _buildBottomNavigationBar(context),

        ///< Builds the bottom navigation bar.
      ),
    );
  }

  /// Builds the AppBar for the home page.
  ///
  /// @param context The BuildContext for the widget.
  /// @return A `PreferredSizeWidget` representing the app bar.
  PreferredSizeWidget _buildAppBar(final BuildContext context) {
    return GFAppBar(
      title: Text(S.of(context).appTitle),

      ///< Displays the title of the app.
    );
  }

  /// Builds the main body content of the page.
  ///
  /// @param context The BuildContext for the widget.
  /// @return A `Widget` representing the main content (Placeholder for now).
  Widget _buildBody(final BuildContext context) {
    return const Placeholder();

    ///< A placeholder widget, replace with actual content.
  }

  /// Builds the bottom navigation bar for the page.
  ///
  /// @param context The BuildContext for the widget.
  /// @return A `BottomNavigationBar` widget with navigation items.
  BottomNavigationBar _buildBottomNavigationBar(final BuildContext context) {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(
        label: S.of(context).buttonHome,

        ///< Home button.
        icon: const Icon(Icons.home),
      ),
      BottomNavigationBarItem(
        label: S.of(context).buttonExit,

        ///< Exit button.
        icon: const Icon(Icons.close),
      ),
    ]);
  }

  /// Builds the navigation drawer for the page.
  ///
  /// This drawer contains options for selecting themes, languages, and setting the intro seen status.
  ///
  /// @param context The BuildContext for the widget.
  /// @param ref The WidgetRef to read and watch providers.
  /// @return A `Widget` representing the navigation drawer.
  Widget _buildDrawer(final BuildContext context, final WidgetRef ref) {
    final themes = {
      S.of(context).lightTheme: AppThemes.lightTheme,

      ///< Light theme.
      S.of(context).darkTheme: AppThemes.darkTheme,

      ///< Dark theme.
      S.of(context).highContrast: AppThemes.highContrastTheme,

      ///< High contrast theme.
      S.of(context).biggerFonts: AppThemes.olderPeopleTheme,

      ///< Theme with bigger fonts.
    };

    final locales = {
      S.of(context).english: const Locale('en'),

      ///< English locale.
      S.of(context).german: const Locale('de'),

      ///< German locale.
    };

    final currentTheme = ref.watch(themeNotifierProvider);

    ///< Watches the current theme.
    final currentLocale = ref.watch(localeNotifierProvider);

    ///< Watches the current locale.
    final introSeen = ref.watch(introSeenProvider);

    ///< Watches the intro seen status.

    return GFDrawer(
      child: StatefulBuilder(
        builder: (final BuildContext context, final StateSetter setState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(S.of(context).selectTheme),

              ///< Label for theme selection.

              /// Dropdown for selecting a theme.
              DropdownButton<String>(
                value: themes.entries
                    .firstWhere((final entry) => entry.value == currentTheme)
                    .key,
                onChanged: (final String? newTheme) async {
                  if (newTheme != null) {
                    final selectedTheme = themes[newTheme];
                    if (selectedTheme != null) {
                      await ref
                          .read(themeNotifierProvider.notifier)
                          .setTheme(selectedTheme);

                      ///< Sets the selected theme.
                      setState(() {});

                      ///< Updates the state.
                    }
                  }
                },
                items: themes.keys
                    .map<DropdownMenuItem<String>>((final String themeName) {
                  return DropdownMenuItem<String>(
                    value: themeName,
                    child: Text(themeName),

                    ///< Theme name in the dropdown.
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Text(S.of(context).selectLanguage),

              ///< Label for language selection.

              /// Dropdown for selecting a language.
              DropdownButton<String>(
                value: locales.entries
                    .firstWhere((final entry) => entry.value == currentLocale)
                    .key,
                onChanged: (final String? newLanguage) {
                  if (newLanguage != null) {
                    final selectedLocale = locales[newLanguage];
                    if (selectedLocale != null) {
                      ref
                          .read(localeNotifierProvider.notifier)
                          .setLocale(selectedLocale);

                      ///< Sets the selected locale.
                      setState(() {});

                      ///< Updates the state.
                    }
                  }
                },
                items: locales.keys
                    .map<DropdownMenuItem<String>>((final String languageName) {
                  return DropdownMenuItem<String>(
                    value: languageName,
                    child: Text(languageName),

                    ///< Language name in the dropdown.
                  );
                }).toList(),
              ),

              /// Checkbox for the intro seen status.
              GFCheckbox(
                onChanged: (final bool? newValue) {
                  if (newValue != null) {
                    ref.read(introSeenProvider.notifier).setIntroSeen(newValue);

                    ///< Sets the intro seen status.
                  }
                },
                value: introSeen,

                ///< Current value of the intro seen checkbox.
              ),
            ],
          );
        },
      ),
    );
  }
}
