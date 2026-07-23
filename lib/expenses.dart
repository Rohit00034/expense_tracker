import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
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
  final List<Expense> _registeredExpenses = [ //we cannot keep a list const as it is going to be modified in memory even if it is final as we will be adding expenses in the list  
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
        children: 
        [
        const Text('The chart'), 
        Expanded(child: ExpensesList(expenses: _registeredExpenses))],//we wrapped ExpensesList with expanded() because THE Expenses() widget displays a column and the ExpensesList is also diplaying a list which is a column so when we build the app we do not see any ExpensesList before wrapping it with expanded .that is because there is a column inside a column and with flutter we run into such problem with such combination.     
      ),
    );
  }
}
