import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expense/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.removeExpense});

  final void Function(Expense expense) removeExpense;

  final List<Expense> expenses;

  @override
  State<ExpenseList> createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 1,
      duration: Duration(
        milliseconds: 300,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: ListView.builder(
        itemCount: widget.expenses.length,
        itemBuilder: (ctx, index) {
          return Dismissible(
            onDismissed: (direction) {
              widget.removeExpense(widget.expenses[index]);
            },
            key: ValueKey(widget.expenses[index]),
            child: ExpenseItem(
              expense: widget.expenses[index],
            ),
          );
        },
      ),
      builder: (ctx, child) => SlideTransition(
        child: child,
        position: Tween(
          begin: Offset(0, 0.2),
          end: Offset(0, 0),
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeIn,
          ),
        ),
      ),
    );
  }
}
