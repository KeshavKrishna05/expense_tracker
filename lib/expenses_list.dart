import 'package:expense_tracker/list_item.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList({required this.ondismiss, required this.expenses, super.key});
  void Function(Expense) ondismiss;
  List<Expense> expenses;
  @override
  Widget build(context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error, //Usinf the the themeing
        ),
        onDismissed: (direction) {
          ondismiss(expenses[index]);
        },
        key: ValueKey(expenses[index]),
        child: ListItem(
          expenses[index],
        ),
      ),
    );
  }
}
