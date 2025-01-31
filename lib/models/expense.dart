import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

var formatter = DateFormat('yyyy-MM-dd');

enum Category { Leisure, Food, Travel, Work }

const categoryIcons = {
  Category.Leisure: Icons.star,
  Category.Food: Icons.fastfood,
  Category.Travel: Icons.category,
  Category.Work: Icons.work,
};

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = UniqueKey().toString();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  String formattedDate() {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenses});
  ExpenseBucket.forCategory(
      {required List<Expense> allexpenses, required this.category})
      : expenses = allexpenses
            .where((expense) => expense.category == category)
            .toList();
  final Category category;
  final List<Expense> expenses;


  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
