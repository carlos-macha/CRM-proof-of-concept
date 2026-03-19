import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF1B2E49),
    primary: const Color(0xFF1B2E49),
    onPrimary: Colors.white,
    secondary: const Color(0xFF00C853),
    onSecondary: Colors.white,
    surface: const Color(0xFFF5F7FA),
    onSurface: const Color(0xFF333333),
    error: Colors.red,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1B2E49),
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF00C853),
      foregroundColor: Colors.white,
    ),
  ),
  useMaterial3: true,
);

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color(0xFF1E3A8A),
    primary: const Color(0xFF1E3A8A),
    onPrimary: Colors.white,
    secondary: const Color(0xFF81C784),
    onSecondary: Colors.black,
    surface: const Color(0xFF121212),
    onSurface: const Color(0xFFFFFFFF),
    error: Colors.redAccent,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF1E3A8A),
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF81C784),
      foregroundColor: Colors.black,
    ),
  ),
  useMaterial3: true,
);