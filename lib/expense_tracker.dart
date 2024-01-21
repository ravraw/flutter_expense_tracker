import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/expense_list/expenses_list.dart';
import 'package:flutter_expense_tracker/models/expense.dart';
import 'package:flutter_expense_tracker/new_expense.dart';

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

  void _addExpense(Expense expense) {
    setState(() {
      _dummyExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _dummyExpenses.remove(expense);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return NewExpense(_addExpense);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget expenseItemsList = const Center(
      child: Text("No Expenses Added Yet!"),
    );

    if (_dummyExpenses.isNotEmpty) {
      expenseItemsList = ExpensesList(
        expenses: _dummyExpenses,
        removeExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text("Expense Dashboard"),
          Expanded(child: expenseItemsList),
        ],
      ),
    );
  }
}
