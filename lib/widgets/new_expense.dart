import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget{
  const NewExpense({super.key});
  @override
  State<NewExpense> createState(){
      return _NewExpenseState();
  }
}
class _NewExpenseState extends State<NewExpense>{
  var _enteredTitle= '';
  void _saveTitleInput(String inputValue){
    _enteredTitle=inputValue;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children:  [
      TextField( //text input field widget
        onChanged: _saveTitleInput, //onChanged calls a function given to it when any change in the textfield
        maxLength: 50, //defines how many max characters can be entered
        // keyboardType: TextInputType.text, tell which keyboard to open best optimized for the current usecase here TextInputType is enum
        decoration: const InputDecoration( //to add a label to the input text field we need to use the decoration parameter with this widget
              label: Text('Title')
            ),  
          ),
          ElevatedButton(onPressed: (){print(_enteredTitle);}, child: Text('Save Expense'))
        ],
      ),
    );
  }
}