
import 'package:expense_reporter/models/expense.dart';
import 'package:expense_reporter/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key, required this.expenses, required this.removeExpenses});

  final void Function(Expense expense) removeExpenses;


  final  List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expenses.length, itemBuilder: ((context, index) {
        return Dismissible(
          key: ValueKey(expenses[index]), 
          onDismissed: (direction) {
            removeExpenses(expenses[index]);
          },
          child: ExpensesItem(expense: expenses[index]),
          );
    }));
  }
}