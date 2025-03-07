import 'dart:io';

import 'package:expense_reporter/models/expense.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewExpenses extends StatefulWidget {
  const NewExpenses({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpenses> createState() {
    return _NewExpensesState();
  }
}

class _NewExpensesState extends State<NewExpenses> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? selectedDate;
  Category selectedCategory = Category.food;

  Future<void> _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      selectedDate = pickedDate;
    });
  }

  void _showDailog() {
    if (Platform.isIOS) {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: const Text(
                "Invalid Input",
              ),
              content: const Text(
                  "Please make sure valid Title, Amount, Date and Category was entered"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Okay")),
              ],
            );
          });
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              "Invalid Input",
            ),
            content: const Text(
                "Please make sure valid Title, Amount, Date and Category was entered"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Okay")),
            ],
          );
        },
      );
    }
  }

  void _submitExpansesData() {
    final enterAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enterAmount == null || enterAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        selectedDate == null) {
      return _showDailog();
    }

    widget.onAddExpense(Expense(
        title: _titleController.text.trim(),
        amount: enterAmount,
        date: selectedDate!,
        category: selectedCategory));

    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  // var enteredTitle = '';
  // void saveTitleValue(String inputValue) {
  //   enteredTitle = inputValue;
  // }
  TextField get titleTextField => TextField(
        //onChanged: saveTitleValue,
        controller: _titleController,
        maxLength: 50,
        decoration: const InputDecoration(
          label: Text("Title"),
        ),
      );

  TextField get amountTextField => TextField(
        controller: _amountController,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          prefixText: '\$ ',
          label: Text("Amount"),
        ),
      );

  Row get selectDateRow => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(selectedDate == null
              ? 'Selected Date'
              : formatter.format(selectedDate!)),
          IconButton(
              onPressed: _presentDatePicker,
              icon: const Icon(Icons.calendar_month)),
        ],
      );

  DropdownButton get categoryDropDown => DropdownButton(
        value: selectedCategory,
        items: Category.values
            .map((category) => DropdownMenuItem(
                value: category, child: Text(category.name.toUpperCase())))
            .toList(),
        onChanged: (value) {
          if (value == null) {
            return;
          }
          setState(() {
            selectedCategory = value;
          });
        },
      );

  Row get saveCancelButton => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel')),
          ElevatedButton(
              onPressed: _submitExpansesData, child: const Text("Save Expense"))
        ],
      );

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    return LayoutBuilder(builder: (context, constrants) {
      final width = constrants.maxWidth;
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
            child: Column(
              children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: titleTextField),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(child: amountTextField),
                    ],
                  )
                else
                  titleTextField,
                if (width >= 600)
                  Row(
                    children: [
                      categoryDropDown,
                      const Spacer(),
                      Expanded(child: selectDateRow),
                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(child: amountTextField),
                      const SizedBox(width: 16),
                      Expanded(child: selectDateRow),
                    ],
                  ),
                const SizedBox(
                  height: 16,
                ),
                if (width >= 600)
                  saveCancelButton
                else
                  Row(
                    children: [
                      categoryDropDown,
                      const Spacer(),
                      saveCancelButton
                    ],
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}
