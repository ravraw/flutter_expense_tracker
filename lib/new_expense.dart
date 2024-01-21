import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/models/expense.dart' as expense_model;

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  expense_model.Category? _selectedCategory;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now.subtract(const Duration(days: 365)),
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _setCategory(expense_model.Category category) {
    if (category == _selectedCategory) {
      return;
    }
    setState(() {
      _selectedCategory = category;
    });
  }

  void _submitExpense() {
    final title = _titleController.text.trim();
    final amount = double.tryParse(_amountController.text) ?? 0.0;
    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }
    final newExpense = expense_model.Expense(
      title: title,
      amount: amount,
      date: _selectedDate!,
      category: _selectedCategory ?? expense_model.Category.other,
    );
    Navigator.of(context).pop(newExpense);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: "Title"),
            maxLength: 50,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      prefixText: '\$ ', labelText: "Amount"),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Selected Date'),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton(
                value: _selectedCategory,
                items: expense_model.Category.values
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(describeEnum(category)
                                  .characters
                                  .first
                                  .toUpperCase() +
                              describeEnum(category).substring(1)),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  _setCategory(value);
                },
                hint: const Text("Select Category"),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_selectedDate);
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
                child: const Text("Save Exp"),
              )
            ],
          )
        ],
      ),
    );
  }
}
