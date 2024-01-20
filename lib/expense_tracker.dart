import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/expense_list/expenses_list.dart';
import 'package:flutter_expense_tracker/models/expense.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({Key? key}) : super(key: key);

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  final List<Expense> _dummyExpenses = [
    Expense(
      title: "Groceries",
      amount: 100.00,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: "Rent",
      amount: 500.00,
      date: DateTime.now(),
      category: Category.rent,
    ),
    Expense(
      title: "Gas",
      amount: 50.00,
      date: DateTime.now(),
      category: Category.utilities,
    ),
    Expense(
      title: "Movie",
      amount: 20.00,
      date: DateTime.now(),
      category: Category.entertainment,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
      ),
      body: Column(
        children: [
          const Text("Expense Dashboard"),
          ExpensesList(expenses: _dummyExpenses),
        ],
      ),
    );
  }
}
