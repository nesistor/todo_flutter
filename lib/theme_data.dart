import 'package:flutter/material.dart';

ThemeData todoThemeData = ThemeData(
  primarySwatch: Colors.blue,
  scaffoldBackgroundColor: const Color(0xFF0A0A0A),
  fontFamily: 'Montserrat',
  textTheme: const TextTheme(
    labelMedium: TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    labelSmall: TextStyle(
      color: Colors.white,
      fontFamily: 'Poppins',
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    headlineLarge: TextStyle(
      fontSize: 36,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      color: Colors.white,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    ),
  ),

);