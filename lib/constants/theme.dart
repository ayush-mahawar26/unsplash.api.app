import 'package:flutter/material.dart';
import 'package:unsplash_api/constants/colors.dart';

class AppTheme {
  ThemeData appThemeData() {
    return ThemeData(
        textTheme: TextTheme(
            bodyLarge: TextStyle(color: black, fontSize: 21),
            bodyMedium: TextStyle(color: black, fontSize: 18),
            bodySmall: TextStyle(color: black, fontSize: 16)));
  }
}
