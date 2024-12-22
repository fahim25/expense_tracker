import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/resourse/widget/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registredExpense = [
    Expense(
        title: "Food",
        amount: 100,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Dinner",
        amount: 100,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Brakfast",
        amount: 100,
        date: DateTime.now(),
        category: Category.food),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Chart'),
          Expanded(
            child: ExpensesList(expenses: _registredExpense),
          ),
        ],
      ),
    );
  }
}
