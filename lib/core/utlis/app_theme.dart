import 'package:ecom/core/utlis/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryLight,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryDark,
          unselectedItemColor: AppColors.whiteColor,
          backgroundColor: AppColors.primaryLight),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: AppColors.primaryLight,
            foregroundColor: AppColors.whiteColor
          ));

  static final ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryDark,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryLight,
          unselectedItemColor: AppColors.whiteColor,
          backgroundColor: AppColors.primaryDark),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: AppColors.primaryDark,
                foregroundColor: AppColors.whiteColor
          ));
}
