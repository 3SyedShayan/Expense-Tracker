import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addExpense});

  @override
  State<NewExpense> createState() => _NewExpenseState();
  final Function(Expense expense) addExpense;
}

class _NewExpenseState extends State<NewExpense> {
  var enteredName = TextEditingController();
  var enteredAmount = TextEditingController();

  DateTime? selectedDate;
  var val = Category.Food;
  void _getDate() async {
    var now = DateTime.now();
    var firstDate = DateTime(now.year - 1, now.month);
    var lastDate = DateTime(now.year + 1, now.month);
    final date = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: lastDate);
    setState(() {
      selectedDate = date;
    });
  }

  @override
  void dispose() {
    enteredName.dispose();
    enteredAmount.dispose();
    super.dispose();
  }

  void _validateFields() {
    var validateAmount = double.tryParse(enteredAmount.text);
    final amountisValid = validateAmount == null || validateAmount <= 0;

    if (enteredName.text.trim().isEmpty ||
        amountisValid ||
        selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Invalid Input'),
          content: Text('Please enter valid name and amount'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text('Okay'),
            )
          ],
        ),
      );

      // return;
    } else
      widget.addExpense(
        Expense(
            amount: validateAmount!,
            title: enteredName.text,
            date: selectedDate!,
            category: val),
      );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: enteredName,
            decoration: InputDecoration(
              label: Text("Name"),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: enteredAmount,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: '\$ ',
                    label: Text("Amount"),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      selectedDate == null
                          ? 'Select Date'
                          : formatter.format(selectedDate!),
                    ),
                    IconButton(
                      onPressed: _getDate,
                      icon: Icon(
                        Icons.calendar_today,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              DropdownButton(
                  value: val,
                  items: Category.values
                      .map(
                        (value) => DropdownMenuItem(
                          value: value,
                          child: Text(
                            value.name.toUpperCase(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      val = value;
                    });
                    print(val);
                  }),
              Spacer(),
              ElevatedButton(
                onPressed: _validateFields,
                // Navigator.of(context).pop();

                child: Text('Add Expense'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
