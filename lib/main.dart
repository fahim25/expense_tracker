import 'package:expense_tracker/resourse/widget/expenses.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Expenses(),
    ),
  );
}
