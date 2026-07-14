import 'package:flutter/material.dart';
import 'package:tastehub/core/utils/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,

    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primMain),

    scaffoldBackgroundColor: AppColors.primScaffoldBG,

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.primTextColor,
      ),

      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.primTextColor,
      ),

      bodyLarge: TextStyle(fontSize: 16, color: AppColors.primTextColor),

      bodyMedium: TextStyle(fontSize: 14, color: AppColors.primTextColor),

      labelSmall: TextStyle(fontSize: 12, color: AppColors.primTextColor),
    ),

    appBarTheme: AppBarTheme(backgroundColor: AppColors.primScaffoldBG)
  );
}
