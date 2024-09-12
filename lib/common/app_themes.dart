import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppThemes {
  static final Map<String, ThemeMode> themes = {
    'Light Theme': ThemeMode.light,
    'Dark Theme': ThemeMode.dark,
    'High Contrast': ThemeMode.dark, // Use custom theme if necessary
    // Add more themes as needed
  };
  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.background,
    cardColor: AppColors.cardBackground,
    textTheme: TextTheme(
      displayLarge:
          AppTextStyle.headline1.copyWith(color: AppColors.textPrimary),
      displayMedium:
          AppTextStyle.headline2.copyWith(color: AppColors.textPrimary),
      titleMedium:
          AppTextStyle.subtitle1.copyWith(color: AppColors.textSecondary),
      bodyLarge: AppTextStyle.bodyText1.copyWith(color: AppColors.textPrimary),
      bodyMedium:
          AppTextStyle.bodyText2.copyWith(color: AppColors.textSecondary),
      labelLarge: AppTextStyle.button.copyWith(color: Colors.white),
      bodySmall: AppTextStyle.caption.copyWith(color: AppColors.textMuted),
      labelSmall: AppTextStyle.overline.copyWith(color: AppColors.textMuted),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      titleTextStyle: AppTextStyle.headline2.copyWith(color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.buttonPrimary,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
      brightness: Brightness.light, // Ensure brightness matches
    )
        .copyWith(
          secondary: AppColors.accentColor, // Accent color
        )
        .copyWith(surface: AppColors.background),
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.baseColor,
    scaffoldBackgroundColor: AppColors.baseColor,
    cardColor: AppColors.cardBackground,
    textTheme: TextTheme(
      displayLarge:
          AppTextStyle.headline1.copyWith(color: AppColors.textPrimary),
      displayMedium:
          AppTextStyle.headline2.copyWith(color: AppColors.textPrimary),
      titleMedium:
          AppTextStyle.subtitle1.copyWith(color: AppColors.textSecondary),
      bodyLarge: AppTextStyle.bodyText1.copyWith(color: AppColors.textPrimary),
      bodyMedium:
          AppTextStyle.bodyText2.copyWith(color: AppColors.textSecondary),
      labelLarge: AppTextStyle.button.copyWith(color: Colors.white),
      bodySmall: AppTextStyle.caption.copyWith(color: AppColors.textMuted),
      labelSmall: AppTextStyle.overline.copyWith(color: AppColors.textMuted),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.baseColor,
      titleTextStyle: AppTextStyle.headline2.copyWith(color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.buttonPrimary,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blueGrey,
      brightness: Brightness.dark, // Ensure brightness matches
    )
        .copyWith(
          secondary: AppColors.accentColor,
        )
        .copyWith(surface: AppColors.baseColor),
  );

  // Accessibility High Contrast Theme
  static final ThemeData highContrastTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.black,
    textTheme: TextTheme(
      displayLarge: AppTextStyle.headline1
          .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
      displayMedium: AppTextStyle.headline2
          .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
      titleMedium: AppTextStyle.subtitle1.copyWith(color: Colors.black),
      bodyLarge:
          AppTextStyle.bodyText1.copyWith(color: Colors.black, fontSize: 18),
      bodyMedium: AppTextStyle.bodyText2.copyWith(color: Colors.black),
      labelLarge: AppTextStyle.button.copyWith(color: Colors.black),
      bodySmall: AppTextStyle.caption.copyWith(color: Colors.black),
      labelSmall: AppTextStyle.overline.copyWith(color: Colors.black),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: AppTextStyle.headline2.copyWith(color: Colors.yellow),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.yellow,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: const ColorScheme.highContrastLight(
      primary: Colors.black,
      onPrimary: Colors.white,
      secondary: Colors.yellow,
      onSecondary: Colors.black,
      brightness: Brightness.light, // Sync brightness
    ).copyWith(surface: Colors.white),
  );

  // Older People Theme (Larger Text)
  static final ThemeData olderPeopleTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.background,
    cardColor: AppColors.cardBackground,
    textTheme: TextTheme(
      displayLarge: AppTextStyle.headline1.copyWith(fontSize: 36),
      displayMedium: AppTextStyle.headline2.copyWith(fontSize: 28),
      titleMedium: AppTextStyle.subtitle1.copyWith(fontSize: 22),
      bodyLarge: AppTextStyle.bodyText1.copyWith(fontSize: 18),
      bodyMedium: AppTextStyle.bodyText2.copyWith(fontSize: 16),
      labelLarge: AppTextStyle.button.copyWith(fontSize: 20),
      bodySmall: AppTextStyle.caption.copyWith(fontSize: 16),
      labelSmall: AppTextStyle.overline.copyWith(fontSize: 14),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      titleTextStyle:
          AppTextStyle.headline2.copyWith(color: Colors.white, fontSize: 28),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.buttonPrimary,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
      brightness: Brightness.light, // Sync brightness
    )
        .copyWith(
          secondary: AppColors.accentColor,
        )
        .copyWith(surface: AppColors.background),
  );
}
