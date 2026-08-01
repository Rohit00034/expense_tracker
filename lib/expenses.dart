import 'package:expense_tracker/widgets/chart/chart.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
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
    // Expense(
    //   title: 'Flutter Course',
    //   amount: 999.00,
    //   date: DateTime.now(), //the DateTime constructor is used here to pass an object to the main Expense() constructor .now() gives current date and time
    //   category: Category.work,
    // ),
    // Expense(
    //   title: 'Cinema',
    //   amount: 350.00,
    //   date: DateTime.now(),
    //   category: Category.leisure,
    // ),
  ];

void _addRegisteredExpense(Expense expense){
setState(() {
_registeredExpenses.add(expense);
});
}
void _removeRegisteredExpense(Expense expense){
  final expenseIndex= _registeredExpenses.indexOf(expense);
  setState(() {
  _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars(); //if we remove expense one after the other we see that the snackbar for the first expense remains for 3 seconds as the duration set and after that the snackbar for the second one appears and we dont want that so we are using this to clear all the previous snackbars instantly
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),//used to set time duration for till how much time will be the snackbar be visible/show before disappearing ,make sure to add persist:false with this
        persist: false,//used to make the snackbar remain as is not disappearing after a short duration   
        content: Text('Expense Deleted.'), //used to set the content that will be displayed in the snackbar 
        action: SnackBarAction(  //this is the undo button/action that will be performed after pressing the actionbutton
          label: 'Undo', 
          onPressed: (){
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense); //the insert method inserts the expense in the correct position as before to ensure the expense comes back at the position it was in list as well as the display
            });
          }),

          ),
        ); //the ScaffoldeMessenger.of(context) gives us an object and the showSnackbar() is used here to show a small bar on the bottom of the screen for some time to undo etc.
}
void _openAddExpenseOverlay(){//modal bottomsheet widget is a overlay which opens from bottom like a widget opening from bottom over the screen
  showModalBottomSheet(
    isScrollControlled: true, //this makes the Overlay occupy the whole screen so that the keyboard does not obstruct the category selection field as initllay this overlay was opening and being close to the opened keyboard
    context: context, 
    builder: (ctx)=> NewExpense(addExpenseToList:_addRegisteredExpense,)
    ); //context-context for the expenses widget and ctx-is context for showModalBottomSheet() widget ,thats why the names are different.hover over the builder parameter to see what it wants .the context here is a property given by flutter ,and every widget has a context property already given by flutter bts,the context property is like a metadata of the widget and also shows the location of widget in the widget tree 
}

  @override
  Widget build(context) {
    Widget maincontent=Center(child: const Text('No Expenses found.Start by adding some!'));
    if(_registeredExpenses.isNotEmpty){
      maincontent=ExpensesList(expenses: _registeredExpenses,onremoveExpense: _removeRegisteredExpense,);
    }
    return Scaffold(
      appBar: AppBar( //by adding the appbar flutter makes sure that all the widgets fit properly on screen and also adds blank space not occupying the camera and device input(shutter) section
        title: Text('Flutter ExpenseTracker'),
        actions: [ //this is mainly used for adding buttons to the appBar at the top
            IconButton( //this is type of button which only includes an icon not text and icon both as back when we used .icon() constructor over other buttons
              onPressed: _openAddExpenseOverlay, 
              icon: const Icon(Icons.add),
              )
        ],
        ),
      body: Column(
        children: 
        [
        Chart(expenses: _registeredExpenses), 
        Expanded(child: maincontent)],//we wrapped ExpensesList with expanded() because THE Expenses() widget displays a column and the ExpensesList is also diplaying a list which is a column so when we build the app we do not see any ExpensesList before wrapping it with expanded .that is because there is a column inside a column and with flutter we run into such problem with such combination.     
      ),
    );
  }
}
