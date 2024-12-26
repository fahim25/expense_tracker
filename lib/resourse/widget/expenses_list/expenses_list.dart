import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/resourse/widget/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final void Function(Expense expense) onRemoveExpense;
  List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          background: Container(
            decoration: BoxDecoration(
              // color: Colors.red,
              color: Theme.of(context).colorScheme.error,
              borderRadius: BorderRadius.circular(20), // Add rounded border
            ),

            // margin: const EdgeInsets.symmetric(
            //   horizontal: 8,
            //   vertical: 16,
            // ),
            margin: EdgeInsets.symmetric(
              horizontal: Theme.of(context).cardTheme.margin!.horizontal,
              vertical: Theme.of(context).cardTheme.margin!.vertical,
            ),
          ),
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
          key: ValueKey(expenses[index]),
          child: ExpenseItem(
            expenses[index],
          )),
    );
  }
}
