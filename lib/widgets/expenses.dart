import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/charts/chart.dart';
import 'package:expense_tracker/widgets/charts/chart2.dart';
import 'package:expense_tracker/widgets/expense/newExpense.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

final List<Expense> _registeredExpenses = [
  Expense(
      title: 'Shoes',
      amount: 100,
      date: DateTime.now(),
      category: Category.Leisure),
  Expense(
    title: 'Food',
    amount: 50,
    date: DateTime.now(),
    category: Category.Food,
  ),
  Expense(
      title: 'Other',
      amount: 20,
      date: DateTime.now(),
      category: Category.Work),
];

class _ExpensesState extends State<Expenses> {
  void addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
      print(_registeredExpenses);
    });
  }

  void removeExpense(Expense expense) {
    var expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Removed Successfully"),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  void _openOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewExpense(
              addExpense: addExpense,
            ));
  }

  @override
  Widget build(BuildContext context) {
    Widget contentUpdate = Text("No Expenses to Show!, Pls Add an Expense");
    if (_registeredExpenses.isNotEmpty) {
      contentUpdate = ExpenseList(
        expenses: _registeredExpenses,
        removeExpense: removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense Tracker',
        ),
        actions: [
          IconButton(
            onPressed: _openOverlay,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart2(
            allExpenses: _registeredExpenses,
          ),
          Expanded(child: contentUpdate),
        ],
      ),
    );
  }
}
