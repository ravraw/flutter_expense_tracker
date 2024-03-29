import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(expense.title),
          const SizedBox(height: 8),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text('\$${expense.amount.toStringAsFixed(2)}'),
            const Spacer(),
            Row(
              children: [
                Icon(categoryIcons[expense.category], size: 16),
                const SizedBox(width: 8),
                Text(expense.date.toString().split(' ').first),
              ],
            ),
          ]),
        ],
      ),
    ));
  }
}
