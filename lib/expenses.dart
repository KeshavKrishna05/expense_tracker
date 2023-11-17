import 'package:expense_tracker/chart/chart.dart';
import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _requiredExpense = [
    Expense(
        title: 'Flutter Course',
        amount: 20,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Movie',
        amount: 15.25,
        date: DateTime.now(),
        category: Category.lesire),
  ];

  void addexpense(Expense exp) {
    setState(() {
      _requiredExpense.add(exp);
    });
  }

  void removeexpense(Expense exp) {
    final index = _requiredExpense.indexOf(exp);
    setState(() {
      _requiredExpense.remove(exp);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Deleted Expense'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              _requiredExpense.insert(index, exp);
            });
          },
        ),
      ),
    );
  }

  void feeddata() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpense(
            addexpense: addexpense,
          );
        });
  }

  @override
  Widget build(context) {
    var width = MediaQuery.of(context).size.width;
    Widget display = const Center(child: Text('No Content Added'));
    if (_requiredExpense.isNotEmpty) {
      display = ExpensesList(
        expenses: _requiredExpense,
        ondismiss: removeexpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense_Tracker'),
        actions: [
          IconButton(
            onPressed: feeddata,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _requiredExpense),
                Expanded(
                  child: display,
                ),
              ],
            )
          : Row(
              children: [
                Expanded(child: Chart(expenses: _requiredExpense)),
                Expanded(
                  child: display,
                ),
              ],
            ),
    );
  }
}
