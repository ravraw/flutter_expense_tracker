import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            maxLength: 50,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Date"),
          ),
          TextField(
            decoration: InputDecoration(labelText: "Category"),
          ),
        ],
      ),
    );
  }
}
