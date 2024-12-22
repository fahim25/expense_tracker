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
        category: Category.work),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Text('Modal from bottom'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
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
