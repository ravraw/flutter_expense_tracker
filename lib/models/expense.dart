import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  food,
  utilities,
  rent,
  travel,
  entertainment,
  other,
}

const categoryIcons = {
  Category.food: Icons.local_grocery_store,
  Category.utilities: Icons.lightbulb_outline,
  Category.rent: Icons.home,
  Category.travel: Icons.flight,
  Category.entertainment: Icons.movie,
  Category.other: Icons.attach_money,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}
