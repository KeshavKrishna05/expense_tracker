import 'package:flutter/material.dart';

import 'package:expense_tracker/expenses.dart';

var kcolorscheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 201, 150, 248),
);
var kdarkcolorscheme = ColorScheme.fromSeed(
  brightness: Brightness.dark, //....Compolsary step for dark shades
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);
void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kdarkcolorscheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kdarkcolorscheme.onPrimaryContainer,
          foregroundColor: kdarkcolorscheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kdarkcolorscheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kdarkcolorscheme.primaryContainer),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kcolorscheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kcolorscheme.onPrimaryContainer,
          foregroundColor: kcolorscheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kcolorscheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kcolorscheme.primaryContainer),
        ),
      ),
      home: const Expenses(),
    ),
  );
}
