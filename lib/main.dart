import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/expense_tracker.dart';

main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
      ),
      body: const Center(
        child: ExpenseTracker(),
      ),
    ),
  ));
}

class App {}
