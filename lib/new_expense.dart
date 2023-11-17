import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:expense_tracker/model/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget {
  NewExpense({required this.addexpense, super.key});
  void Function(Expense) addexpense;
  @override
  State<NewExpense> createState() {
    return _NewExpense();
  }
}

class _NewExpense extends State<NewExpense> {
  var _amountcontroller = TextEditingController();
  var _titlecontroller = TextEditingController();
  void _registerdate() async {
    var now = DateTime.now();
    var initial = DateTime(now.year - 1, now.month, now.day);
    var date = await showDatePicker(
        context: context, initialDate: now, firstDate: initial, lastDate: now);
    setState(() {
      _dateselected = date;
    });
  }

  void _submit() {
    final amount = double.tryParse(_amountcontroller.text);
    final amtvalidity = (amount == null || amount <= 0);
    if (_titlecontroller.text.trim() == null ||
        amtvalidity ||
        _dateselected == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Entry'),
          content: const Text('Please Enter All Correct Value'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }
    widget.addexpense(
      Expense(
          title: _titlecontroller.text,
          amount: amount,
          date: _dateselected!,
          category: _selectedcategory),
    );
    Navigator.pop(context);
  }

  Category _selectedcategory = Category.lesire;
  DateTime? _dateselected;
  @override
  Widget build(context) {
    var keyboradsize = MediaQuery.of(context)
        .viewInsets
        .bottom; //.....To get info from device we use "MediaQuery"
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 48, 16, keyboradsize + 16),
          child: Column(
            children: [
              TextField(
                controller: _titlecontroller,
                maxLength: 50,
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _amountcontroller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text('Amount'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(_dateselected == null
                            ? 'No Date selected'
                            : formatter.format(_dateselected!)),
                        IconButton(
                            onPressed: _registerdate,
                            icon: const Icon(Icons.calendar_month))
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  DropdownButton(
                      value: _selectedcategory,
                      items: Category.values
                          .map((category) => DropdownMenuItem(
                              value: category,
                              child: Text(category.name
                                  .toUpperCase()))) //Why used DropdownMenuItem
                          .toList(),
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }
                        setState(() {
                          _selectedcategory = value;
                        });
                      }),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: _submit,
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
