import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key,required this.expenses,required this.onremoveExpense});
  final List<Expense> expenses;
  final void Function(Expense expense) onremoveExpense;
  @override
  Widget build(BuildContext context) {
    /* return Column(); now here we needed to create a scrollable list of expenses widget ,so let's say a person adds about 1000 expenses but 
    and we have to display all of them in a scrollable list,first thing we think of is a SingleChildScrollView wrapped over a column widget with
    all the hundreds of expenses widgets inside the column.now the problem here is we cannot see all the hundreads of expenses at one time in
    the phone screen ,and here whenever this column widget it created it also creates all the hundreds of expense widgets behing the scenes
    which are not even visible on that screen viewport thus being cost heavy and utilizing resources unnecessarily and also here intially we 
    do not know the lenght of how many widgets/expenses will be added so in such case we should use the ListView(children:[]) widget which 
    still creates all the widgets immediately so we only get here is that it is automatically scrollable and creates a list of widgets just
    like Column() .so here we wil use the follows */
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context,index)=> Dismissible( //this dismissible widget can make its child widget diappear/dismissed by swiping from left to right or right to left
        key: ValueKey(expenses[index]), //we will learn more about keys later but here key is something that helps flutter to uniquely identify a widget ,it is also needed to remove the data associated to the uniquely identifiable widget
        onDismissed: (direction){   //this needs a function of type which accepts DismissDirection as an input which is from left to right or right to left  
          onremoveExpense(expenses[index]);
          } , //this allows to perform action after the widget is removed without this only the widget is removed not the data assoicated with it and gives error in the ui without this.
        child: ExpenseItem(expenses[index]),) 
      ); 
    /*this builder constructor of ListView tell flutter to only build the widget when it is visible on the screen and takes a function as a 
    parameter which should return a widget and have context/ctx and index as a parameter which are given by flutter itself.it also takes a 
    itemscCount parameter which represents the count of the items in the list and the number of items in the list = the number of times the 
    function will be called.Now above we have used an arrow function since we are returning the widget ,and here the index(dtype-int) parameter is used
    to iterate through the list just like a for loop.So here the builder constructor of ListView improves the performance of the app by
    buidling the widgets only when they are needed*/
  }
} 