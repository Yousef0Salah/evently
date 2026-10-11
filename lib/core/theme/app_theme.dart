import 'package:evently/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    colorScheme: const ColorScheme.light(
      primary: AppColors.lightMainColor,
      onPrimary: Colors.white,
      surface: AppColors.lightInputs,
      onSurface: AppColors.lightMainColor,
      secondary: AppColors.lightSecText,
      outline: AppColors.lightStroke,
      error: AppColors.lightRed,
      onPrimaryFixed: AppColors.lightDisable,
    ),

    scaffoldBackgroundColor: AppColors.lightBackground,

    inputDecorationTheme: InputDecorationThemeData(
      hintStyle: TextStyle(color: AppColors.lightSecText),
      fillColor: AppColors.lightInputs,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: .circular(16),
        borderSide: BorderSide(color: AppColors.lightStroke),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: .circular(16),
        borderSide: BorderSide(color: AppColors.lightStroke),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: .circular(16),
        borderSide: BorderSide(color: AppColors.lightRed),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: .circular(16),
        borderSide: BorderSide(color: AppColors.lightRed),
      ),
    ),

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.lightMainText,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.lightMainColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.lightSecText,
        height: 1.5,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightMainColor,
        foregroundColor: Colors.white,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkMainColor,
      onPrimary: Colors.white,
      surface: AppColors.darkInputs,
      onSurface: AppColors.darkMainText,
      secondary: AppColors.darkSecText,
      outline: AppColors.darkStroke,
      error: AppColors.darkRed,
      onPrimaryFixed: AppColors.lightBackground,
    ),

    inputDecorationTheme: InputDecorationThemeData(
      hintStyle: TextStyle(color: AppColors.lightSecText),
      fillColor: AppColors.lightInputs,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: .circular(16),
        borderSide: BorderSide(color: AppColors.darkStroke),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: .circular(16),
        borderSide: BorderSide(color: AppColors.darkStroke),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: .circular(16),
        borderSide: BorderSide(color: AppColors.darkRed),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: .circular(16),
        borderSide: BorderSide(color: AppColors.darkRed),
      ),
    ),

    scaffoldBackgroundColor: AppColors.darkBackground,

    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.darkMainText,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.darkMainText,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.darkSecText,
        height: 1.5,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkMainColor,
        foregroundColor: Colors.white,
      ),
    ),
  );

  // static ThemeData lightTheme = ThemeData(
  //   brightness: Brightness.light,
  //   scaffoldBackgroundColor: AppColors.lightBackground,
  //   primaryColor: AppColors.lightMainColor,
  //   primaryColorLight: AppColors.lightInputs,
  //   primaryColorDark: AppColors.lightMainColor,
  //   dividerColor: AppColors.lightStroke,
  //   textTheme: TextTheme(
  //     titleLarge: TextStyle(
  //       fontWeight: .w600,
  //       fontSize: 20,
  //       color: AppColors.lightMainText,
  //     ),
  //     bodyMedium: TextStyle(
  //       fontWeight: .w400,
  //       fontSize: 16,
  //       color: AppColors.lightSecText,
  //       height: 1.5,
  //     ),
  //     titleMedium: TextStyle(
  //       color: AppColors.lightMainColor,
  //       fontSize: 18,
  //       fontWeight: .w500,
  //     ),
  //   ),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: AppColors.lightMainColor,
  //       foregroundColor: AppColors.lightInputs,
  //     ),
  //   ),
  // );
  // static ThemeData darkTheme = ThemeData(
  //   brightness: Brightness.dark,
  //   scaffoldBackgroundColor: AppColors.darkBackground,
  //   primaryColor: AppColors.darkMainColor,
  //   primaryColorLight: AppColors.darkInputs,
  //   dividerColor: AppColors.darkStroke,
  //   primaryColorDark: Colors.white,
  //   textTheme: TextTheme(
  //     titleLarge: TextStyle(
  //       fontWeight: .w600,
  //       fontSize: 20,
  //       color: AppColors.darkMainText,
  //     ),
  //     bodyMedium: TextStyle(
  //       fontWeight: .w400,
  //       fontSize: 16,
  //       color: AppColors.darkSecText,
  //       height: 1.5,
  //     ),
  //     titleMedium: TextStyle(
  //       color: AppColors.darkMainText,
  //       fontSize: 18,
  //       fontWeight: .w500,
  //     ),
  //   ),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: AppColors.darkMainColor,
  //       foregroundColor: AppColors.darkMainText,
  //     ),
  //   ),
  // );
}
