import 'package:employee_attendance/core/constants/colours.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();
  static final theme = ThemeData().copyWith(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSeed(seedColor: Colours.primaryColor),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colours.primaryColor,
      ),
    ),
  );
}
