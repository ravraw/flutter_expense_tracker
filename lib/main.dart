import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/expense_tracker.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.blue,
  brightness: Brightness.light,
);

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Expense Tracker",
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kColorScheme.primary,
        foregroundColor: kColorScheme.onPrimary,
      ),
      cardTheme: CardTheme(
        color: kColorScheme.surface,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    home: const ExpenseTracker(),
  ));
}
