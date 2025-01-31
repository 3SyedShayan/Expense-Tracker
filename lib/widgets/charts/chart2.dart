import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/charts/chart_bar.dart';
import 'package:flutter/material.dart';

class Chart2 extends StatelessWidget {
  Chart2({super.key, required this.allExpenses});

  List<Expense> allExpenses;
  List<ExpenseBucket> get bucketList {
    return [
      ExpenseBucket.forCategory(
          allexpenses: allExpenses, category: Category.Food),
      ExpenseBucket.forCategory(
          allexpenses: allExpenses, category: Category.Leisure),
      ExpenseBucket.forCategory(
          allexpenses: allExpenses, category: Category.Travel),
      ExpenseBucket.forCategory(
          allexpenses: allExpenses, category: Category.Work),
    ];
  }

  double get maxTotalExpense {
    var heightFill = 0.0;

    for (final bucket in bucketList) {
      if (heightFill < bucket.totalExpenses) {
        heightFill = bucket.totalExpenses;
      }
    }
    return heightFill;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 8,
          ),
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.3),
                Theme.of(context).colorScheme.primary.withOpacity(0.0)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Expanded(
            child: Row(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final fill in bucketList)
                  ChartBar2(
                    fill: fill.totalExpenses == 0
                        ? 0
                        : fill.totalExpenses / maxTotalExpense,
                  ),
              ],
            ),
          ),
        ),
        // Row(
        //     children: bucketList
        //         .map((e) => Icon(categoryIcons[e.category]))
        //         .toList(),
        Row(
          children: bucketList
              .map((e) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(categoryIcons[e.category]),
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }
}
