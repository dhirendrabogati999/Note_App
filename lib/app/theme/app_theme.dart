
import 'package:flutter/material.dart';
import 'package:note_app/app/theme/app_text_theme.dart';
import 'package:note_app/constants/app_colors.dart';

class AppTheme{
  AppTheme._();
  static ThemeData lightTheme = ThemeData(

    useMaterial3: true,

    scaffoldBackgroundColor: AppColors.background,

    textTheme: AppTextTheme.textTheme,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
    ),

    cardTheme: const CardThemeData(
      color: AppColors.white,
      elevation: 0,
    ),

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
    ),

  );
}