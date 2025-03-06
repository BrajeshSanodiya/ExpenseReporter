import 'package:expense_reporter/models/expense.dart';
import 'package:expense_reporter/widgets/expenses_list/expenses_list.dart';
import 'package:expense_reporter/widgets/new_expenses.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registerExpenses = [
    // Expense(
    //     title: "title",
    //     amount: 20.00,
    //     date: DateTime.now(),
    //     category: Category.food),
    // Expense(
    //     title: "title2",
    //     amount: 27.99,
    //     date: DateTime.now(),
    //     category: Category.leisure),
    // Expense(
    //     title: "title3",
    //     amount: 20.00,
    //     date: DateTime.now(),
    //     category: Category.travel),
    // Expense(
    //     title: "title4",
    //     amount: 19.99,
    //     date: DateTime.now(),
    //     category: Category.work),
    // Expense(
    //     title: "title5",
    //     amount: 99.99,
    //     date: DateTime.now(),
    //     category: Category.food),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return NewExpenses(
            onAddExpense: _addExpense,
          );
        });
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registerExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registerExpenses.indexOf(expense);
    setState(() {
      _registerExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: const Text("Expense deleted."),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            _registerExpenses.insert(expenseIndex, expense);
          });
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(child: Text("No content to show"));
    if (_registerExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registerExpenses,
        removeExpenses: _removeExpense,
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Expense Reporter"),
          actions: [
            IconButton(
                onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
          ],
        ),
        body: Column(
          children: [const Text("data"), Expanded(child: mainContent)],
        ));
  }
}
