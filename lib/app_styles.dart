import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  ThemeData darkTheme = ThemeData.dark();
  static const borderRadius = 20.0;

  static const TextStyle titleStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w900,
    letterSpacing: -1,
  );

  static TextTheme textTheme = GoogleFonts.interTextTheme(
    const TextTheme(
      bodyLarge: TextStyle(letterSpacing: -0.5),
      bodyMedium: TextStyle(letterSpacing: -0.5),
      bodySmall: TextStyle(letterSpacing: -0.5),
      labelLarge: TextStyle(letterSpacing: -0.5),
      labelMedium: TextStyle(letterSpacing: -0.5),
      labelSmall: TextStyle(letterSpacing: -0.5),
    ),
  );
}
