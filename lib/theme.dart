import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
  useMaterial3: true,
  iconTheme: const IconThemeData(color: Colors.green),
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.black),
    bodyText2: TextStyle(color: Colors.black),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey.shade200,
    iconTheme: const IconThemeData(color: Colors.white70),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[400],
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: const TextStyle(fontSize: 16),
    unselectedLabelStyle: const TextStyle(fontSize: 14),
  ),
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
  useMaterial3: true,
  iconTheme: const IconThemeData(color: Colors.green),
  textTheme: const TextTheme(
    bodyText1: TextStyle(color: Colors.black),
    bodyText2: TextStyle(color: Colors.black),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.pink.shade100,
    iconTheme: const IconThemeData(color: Colors.white),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: const ColorScheme.dark().surface,
    selectedItemColor: const ColorScheme.dark().primary,
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: const TextStyle(fontSize: 16),
    unselectedLabelStyle: const TextStyle(fontSize: 14),
  ),
);
