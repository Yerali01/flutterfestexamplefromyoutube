import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/themes/app_colors.dart';

const maxScreenWidth = 500.0;

abstract class AppTheme {
  static final light = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: AppColor.darkBackground,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.darkBackground,
      selectedItemColor: AppColor.green,
      unselectedItemColor: AppColor.darkText,
    ),
  );
}
