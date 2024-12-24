import 'package:expense_tracker/resourse/widget/expenses.dart';
import 'package:flutter/material.dart';

var colorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: colorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: colorScheme.onPrimaryContainer,
          foregroundColor: colorScheme.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: colorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSecondaryContainer,
                fontSize: 14,
              ),
            ),
      ),
      home: Expenses(),
    ),
  );
}
