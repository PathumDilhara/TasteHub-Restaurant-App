import 'package:flutter/material.dart';
import 'package:tastehub/core/utils/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,

    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primMain),

    scaffoldBackgroundColor: AppColors.primScaffoldBG,

    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),

      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),

      bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),

      labelSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
    ),

    appBarTheme: AppBarTheme(backgroundColor: AppColors.primScaffoldBG),
  );
}
