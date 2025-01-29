import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColor = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
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
      ),
      home: Expenses(),
    ),
  );
}
