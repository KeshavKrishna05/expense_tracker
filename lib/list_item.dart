import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  ListItem(this.expense, {super.key});
  final Expense expense;
  @override
  Widget build(context) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'RS-${expense.amount.toStringAsFixed(2)}',
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(categoryicon[expense.category]),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          expense.format(),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )));
  }
}
