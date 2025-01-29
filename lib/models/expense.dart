import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

var formatter = DateFormat('yyyy-MM-dd');

enum Category { Luxury, Food, Other }

const categoryIcons = {
  Category.Luxury: Icons.star,
  Category.Food: Icons.fastfood,
  Category.Other: Icons.category,
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
  String formattedDate () {
    return formatter.format(date);
  }
}
