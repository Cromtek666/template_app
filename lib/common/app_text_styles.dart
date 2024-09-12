import 'package:flutter/material.dart';
import 'app_colors.dart'; // Assuming you have the AppColors class

class AppTextStyle {
  // Generic Text Style Getter
  static TextStyle getAppTextStyle({
    final double size = 14,
    final FontWeight weight = FontWeight.normal,
    final FontStyle style = FontStyle.normal,
    final Color color = Colors.black,
  }) {
    return TextStyle(
      fontSize: size,
      fontWeight: weight,
      fontStyle: style,
      color: color,
      fontFamily: "Jost", // You can replace with your font
    );
  }

  // Predefined Styles
  static TextStyle headline1 = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    fontFamily: "Jost",
  );

  static TextStyle headline2 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    fontFamily: "Jost",
  );

  static TextStyle subtitle1 = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    fontFamily: "Jost",
  );

  static TextStyle subtitle2 = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.textMuted,
    fontFamily: "Jost",
  );

  static TextStyle bodyText1 = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    fontFamily: "Jost",
  );

  static TextStyle bodyText2 = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    fontFamily: "Jost",
  );

  static TextStyle button = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.buttonPrimary,
    fontFamily: "Jost",
  );

  static TextStyle caption = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w300,
    color: AppColors.textMuted,
    fontFamily: "Jost",
  );

  static TextStyle overline = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w300,
    color: AppColors.textMuted,
    fontFamily: "Jost",
  );
}
