import 'package:flutter/material.dart';

const ColorScheme appColorScheme = ColorScheme(
  brightness: Brightness.light,

  primary: Color.fromARGB(255, 13, 73, 204), 
  onPrimary: Colors.white,

  secondary: Color.fromARGB(255, 97, 180, 239),
  onSecondary: Colors.white,

  error: Color(0xFFEF4444),
  onError: Colors.white,

  surface: Color(0xFFF8FAFC),
  onSurface: Color(0xFF0F172A),


);

ThemeData appTheme () {
  return ThemeData(
    useMaterial3: true,
    colorScheme: appColorScheme,

    scaffoldBackgroundColor: appColorScheme.surface,

    appBarTheme: AppBarTheme(
      backgroundColor: appColorScheme.primary,
      foregroundColor: appColorScheme.onPrimary,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: appColorScheme.surface,

      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,      
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: appColorScheme.primary,
          width: 1.5,
        ),
      ),

      hintStyle: TextStyle(
        color: Colors.grey.shade500,
      ),

    ),

    chipTheme: ChipThemeData(
      backgroundColor: appColorScheme.secondary.withAlpha(1),
      selectedColor: appColorScheme.secondary,
      labelStyle: TextStyle(
        color: appColorScheme.onSurface,
        fontWeight: FontWeight.w500,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8, 
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),

    ),



  );
}