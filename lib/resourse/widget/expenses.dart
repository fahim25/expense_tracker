import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/resourse/widget/chart/chart.dart';
import 'package:expense_tracker/resourse/widget/expenses_list/expenses_list.dart';
import 'package:expense_tracker/resourse/widget/new_expense.dart';
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
        title: "Pizza Hut",
        amount: 100,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Dinner with family",
        amount: 1000,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: "Star Cineplex",
        amount: 100,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  /* void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  } */
  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (_, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context)
                      .viewInsets
                      .bottom, // Adjust for keyboard
                ),
                child: NewExpense(
                  onAddExpense: _addExpense,
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registredExpense.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registredExpense.indexOf(expense);

    setState(() {
      _registredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Text('Expense Deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registredExpense.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text('No Expenses found! Start adding some.'),
    );

    if (_registredExpense.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registredExpense,
        onRemoveExpense: _removeExpense,
      );
    }

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
          Chart(expenses: _registredExpense),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
