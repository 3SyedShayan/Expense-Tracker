import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kColor = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 59, 181),
);

var kDarkColor = ColorScheme.fromSeed(
  // brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 5, 99, 125),
);
void main() {
  runApp(
    MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColor,
        appBarTheme: AppBarTheme().copyWith(
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            backgroundColor: kDarkColor.primary,
            foregroundColor: kDarkColor.onPrimaryContainer),
        cardTheme: CardTheme().copyWith(
          // shadowColor: const Color.fromARGB(255, 111, 1, 123),
          color: kDarkColor.secondaryContainer,
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: kDarkColor.primaryContainer)),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kDarkColor.onSecondaryContainer,
                fontSize: 14,
              ),
            ),
      ),
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
