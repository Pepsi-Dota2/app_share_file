import 'package:app_share_file/src/core/constant/colors/app_color.dart';
import 'package:flutter/material.dart';

class GarbageTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.grabageColor,
    scaffoldBackgroundColor: AppColors.backgroundWhite,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.textBlack),
      bodyMedium: TextStyle(color: AppColors.textBlack),
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.grabageColor,
      iconTheme: IconThemeData(color: AppColors.textBlack),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.highlightYellow,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.grabageColor,
      secondary: AppColors.lightGreen,
      background: AppColors.neutralGray,
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.darkGreen,
    scaffoldBackgroundColor: AppColors.darkGreen,
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.backgroundWhite),
      bodyMedium: TextStyle(color: AppColors.backgroundWhite),
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.darkGreen,
      iconTheme: IconThemeData(color: AppColors.backgroundWhite),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.warningRed,
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkGreen,
      secondary: AppColors.grabagelight,
      background: AppColors.neutralGray,
    ),
  );
}
