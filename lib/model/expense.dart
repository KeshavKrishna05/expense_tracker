import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();
final categoryicon = {
  Category.lesire: Icons.movie,
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.work: Icons.work,
};

enum Category { lesire, food, travel, work }

class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  String format() {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({
    required this.expenses,
    required this.category,
  });
  ExpenseBucket.forcategory(List<Expense> allexpenses, this.category)
      : expenses = allexpenses
            .where((element) => element.category == category)
            .toList();
  final List<Expense> expenses;
  final Category category;
  double totalexpense() {
    double sum = 0;
    for (int i = 0; i < expenses.length; i++) {
      sum += expenses[i].amount;
    }
    return sum;
  }
}
