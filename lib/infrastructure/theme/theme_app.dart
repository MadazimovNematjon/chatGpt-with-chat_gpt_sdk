import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme:ColorScheme.dark(
      background: Color(0xFF343541),
      primary: Colors.grey.shade900,
      secondary: Colors.grey.shade800,
      onPrimary: Color(0xFF10A37F)
    ),
  );


  //
  // static ThemeData dark = ThemeData.light(useMaterial3: false).copyWith(
  //     colorScheme: ColorScheme.fromSwatch(primarySwatch: AppColors.sea));
}