import 'package:flutter/material.dart';

final appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepOrange,
    primary: Colors.deepOrange,
    secondary: Colors.deepOrangeAccent,
    tertiary: Colors.black,
  ),
  useMaterial3: true,

  appBarTheme: AppBarTheme(
    backgroundColor:
        Colors.deepOrange, // Set the AppBar background color to primary
    foregroundColor: Colors.white, // Set the AppBar text/icon color
  ),
  textTheme: TextTheme(
    displayMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(218, 16, 67, 155),
    ),
    displaySmall: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(218, 16, 67, 155),
    ),
    bodySmall: TextStyle(fontSize: 16, color: Color.fromARGB(218, 16, 67, 155)),
    // Add more styles as needed
  ),
);
