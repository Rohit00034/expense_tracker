import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(), //the DateTime constructor is used here to pass an object to the main Expense() constructor .now() gives current date and time
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 12.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];
  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        children: const [Text('The chart'), Text('The Expenses list..')],
      ),
    );
  }
}
