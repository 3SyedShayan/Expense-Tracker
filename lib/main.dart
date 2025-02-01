import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColor = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 59, 181),
);
void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColor,
        appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kColor.primary,
            foregroundColor: kColor.onPrimaryContainer),
        cardTheme: CardTheme().copyWith(
          color: kColor.secondaryContainer,
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kColor.primaryContainer)),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kColor.onSecondaryContainer,
                fontSize: 14,
              ),
            ),
      ),
      home: Expenses(),
    ),
  );
}
