import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget{
  const NewExpense({super.key});
  @override
  State<NewExpense> createState(){
      return _NewExpenseState();
  }
}
class _NewExpenseState extends State<NewExpense>{
/*var _enteredTitle= ''; 
  void _saveTitleInput(String inputValue){
    _enteredTitle=inputValue;
  }along with this being an approcah to store user input flutter also offers another built in approach which does the heavy lifting of storing user input as below*/  
  final _titleController=TextEditingController(); //this is a class to optimize user input
//when using this Controller() we need to destroy it from memory or else it just occupies the space in memory  
  final _amountController=TextEditingController();
  @override
  void dispose() { //this function is just like build and initState given by StateFulWidget .it is called auto by flutter when the widget/it's state are about to be destroyed(removed from the ui)
    _titleController.dispose(); //deleting the TextEditingController class object from memory ,only state class can implement this method not Stateless
    _amountController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children:  [
      TextField( //text input field widget
    // onChanged: _saveTitleInput, //onChanged calls a function given to it when any change in the textfield        
        controller: _titleController, //instead of onchanged we used the controller
        maxLength: 50, //defines how many max characters can be entered
    // keyboardType: TextInputType.text this is set by default, tell which keyboard to open best optimized for the current usecase here TextInputType is enum        
        decoration: const InputDecoration( //to add a label to the input text field we need to use the decoration parameter with this widget
              label: Text('Title')
            ),  
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: _amountController,
            decoration: InputDecoration(
              prefixText:'\₹ ' ,  //text before the input field
              label: Text('Amount')
              ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context); //this closes the overlay and uses the context given to the build()
                }, 
                child: Text('Cancel')),
              ElevatedButton(
                onPressed: (){print(_titleController.text);print(_amountController.text);}, 
                child: Text('Save Expense')),
            ],
          )
        ],
      ),
    );
  }
}