import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_expense_tracker/expense_tracker.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 66, 165, 245),
  brightness: Brightness.light,
);

main() {
  // -- Code to lock device orientation
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [
  //     DeviceOrientation.portraitUp,
  //   ],
  // ).then((fn) {
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
  // });
}
