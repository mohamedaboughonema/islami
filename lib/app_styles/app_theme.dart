import 'package:flutter/material.dart';
import 'package:islami_app/app_styles/app_color.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarTheme(backgroundColor: AppColor.transparent),
      scaffoldBackgroundColor: AppColor.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: AppColor.white,
        unselectedItemColor: AppColor.darkBrown,
      ));
}
