import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(children: [
          Text(expense.title),
          const SizedBox(height: 6,),
           Row(children: [
            Text('\₹${expense.amount.toStringAsFixed(2)}'), //the \$ is an escape character used to include special characters in string and the ${} is the string injection as we have seen earlier.this toStringAsFixed(2) cuts the last two digits out and converts the given double to a string eg:- 12.3345->12.33 
            const Spacer(), //this Spacer() widget takes all the remaining available space in the main axis of parent and pushes the widgets surrounding it towards the edges of the parent widget,but it does not forcefully squash them ,it allows the surronding widegts to take as much space as they want and then occupies the rest.
            Row(children: [
              Icon(categoryIcons[expense.category]),
              const SizedBox(width: 8,),
              Text(expense.formattedDate)
            ],)          
           ],)
        ],),
      ),
    ); //this Card() widget creates a card like view which adds a shadow behind the widget making it look elevated
  }
}
