import 'package:expense_reporter/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem({super.key, required this.expense});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 16), //.all(8.0),
      child: Column(
        children: [
          Text(expense.title,textAlign: TextAlign.left,),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Text('\$ ${expense.amount.toStringAsFixed(2)}'),
              //Text(expense.category.toStringAsFixed(2)),
              const Spacer(),
              Row(
                children: [
                  Icon(categoryIcons[expense.category]),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(expense.formattedDate)
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
