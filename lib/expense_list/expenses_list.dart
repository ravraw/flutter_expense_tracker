import "package:flutter/material.dart";
import 'package:flutter_expense_tracker/expense_list/expense_item.dart';

import '../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: ListView.builder(
          itemCount: expenses.length,
          itemBuilder: (context, index) {
            final expense = expenses[index];
            return Dismissible(
              key: ValueKey(expense),
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                child: const Icon(Icons.delete),
              ),
              // onDismissed: ,
              child: ExpenseItem(expense: expense),
            );
          }),
    );
  }
}
