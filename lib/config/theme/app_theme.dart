/*import 'package:flutter/material.dart';
import 'package:minimal/config/config.dart';

class AppTheme {
  final bool isDarkMode;

  AppTheme({required this.isDarkMode});

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: AppColors.primaryColor,
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        listTileTheme: ListTileThemeData(
          iconColor: AppColors.primaryColor,
        ),
      );
}*/

import 'package:flutter/material.dart';
import 'package:minimal/config/config.dart';

class AppTheme {
  final bool isDarkMode;

  AppTheme({required this.isDarkMode});

  ThemeData getTheme() {
    final colorScheme = isDarkMode
        ? ColorScheme.dark(
            primary: AppColors.primaryColor,
            secondary: Colors.tealAccent,
            surface: Colors.grey[900]!,
            background: Colors.black,
            onPrimary: Colors.white,
            onSecondary: Colors.black,
            onSurface: Colors.white,
            onBackground: Colors.white,
          )
        : ColorScheme.light(
            primary: AppColors.primaryColor,
            secondary: Colors.teal,
            surface: Colors.white,
            background: Colors.grey[100]!,
            onPrimary: Colors.black,
            onSecondary: Colors.white,
            onSurface: Colors.black,
            onBackground: Colors.black,
          );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      scaffoldBackgroundColor: colorScheme.background,
      listTileTheme: ListTileThemeData(
        iconColor: colorScheme.onSurface,
      ),
    );
  }
}
