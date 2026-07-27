import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart'; //to import the formatter object we created from intl package

class NewExpense extends StatefulWidget{
  const NewExpense({super.key,required this.addExpenseToList});
  final void Function(Expense Object) addExpenseToList;
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
  DateTime? _selectedDate;
  var _selectedCategory= Category.leisure;
  void _displayDatePicker() async {
    final now=DateTime.now(); //this gives current date and time
    final firstDate=DateTime(now.year-1,now.month,now.day); 
    final pickedDate=await showDatePicker(  //built-in function by flutter to display date //the await keyword tells flutter to wait for pickedDate will receive a value in future and then execute the code after it
      context: context, 
      initialDate: now,  //the current date which will be displayed when picker is opened
      firstDate: firstDate, //the oldest date we can choose  like lower limit
      lastDate: now //the newest date we can use like upper limit,
      );/*.then((value){});//showDatePicker() function returns the value but wrapped in a Future object used when there is going to be a value that is not yet here,so the future object is immediately returned even if the value is not picked up yet but flutter knows that some value will be selected ,when this receievs a value we can use the then() function ,once the date is picked here the function inside then() is executed another approach to this is the async await*/ 
      //from this line , code will only be executed once the value is available
      setState(() {
        _selectedDate=pickedDate;
      });
  }
  void _saveExpenseData(){
    final enteredAmount=double.tryParse(_amountController.text); //the dounble.tryParse tries to convert the value to a double eg double.tryparse('hello')=>null ,double.tryparse('3.12')=>3.12 
    final amountIsInvalid= enteredAmount==null || enteredAmount<=0;
    if(_titleController.text.trim().isEmpty || amountIsInvalid ||_selectedDate==null){
      showDialog( //used to show a dialog message
        context: context, 
        builder: (ctx)=>AlertDialog( //widget used to show alerdialog ,there are other options in widgets too rather than this one 
          title: Text('Invalid Input'),
          content: Text('Please make sure a valid title ,amount ,date and category was entered.'),
          actions: [
            TextButton(
              onPressed: (){Navigator.pop(ctx);}, 
              child: Text('Okay'))
          ],
        ));
    return;
    }
    widget.addExpenseToList(Expense(title: _titleController.text, amount: enteredAmount, date: _selectedDate!, category: _selectedCategory));
    Navigator.pop(context);   
  }
  @override
  void dispose() { //this function is just like build and initState given by StateFulWidget .it is called auto by flutter when the widget/it's state are about to be destroyed(removed from the ui)
    _titleController.dispose(); //deleting the TextEditingController class object from memory ,only state class can implement this method not Stateless
    _amountController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,48,16,16), //this adds padding to left,top,right,bottom respectively
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
          Row(
            children: [
          Expanded(//wrapped with Expanded as TextField takes as much as space possible horizontally so it is a problem combination in flutter with Row() as row allows to take much space horizontally too
            child: TextField(
              keyboardType: TextInputType.number,
              controller: _amountController,
              decoration: InputDecoration(
                prefixText:'\₹ ' ,  //text before the input field
                label: Text('Amount')
                ),
            ),
          ),
          const SizedBox(width: 16,),
          Expanded(
            child:Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(_selectedDate==null? 'No Selected Date': formatter.format(_selectedDate!/* ! forces dart that this variable won't be null  */)),
                IconButton(
                  onPressed: _displayDatePicker, 
                  icon: const Icon(
                    Icons.calendar_month),
                    ),
              ],
            )
            ),

            ],
          ),
          SizedBox(height: 16,),
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory, //this is the value which will be shown in dropdown
                items: Category.values.map(
                  (category)=>DropdownMenuItem(
                    value: category, //this is what gets actually selected in code as a value,this value gets passed to the onchanged function
                    child: Text(category.name.toUpperCase()))).toList(), //this is what the user sees 
                onChanged: (value) {
                  if(value==null){
                    return;
                  }
                  setState(() {
                    _selectedCategory=value;
                  });
                }), //Categroy.values converts this enum category to list of values of Category and on this list we use map() ,this map converts the enum list into a Iterable of Dropdownmenuitem then this iterable is converted to List by tolist() thus giving the DropDownButton a List<DropDownMenuItem<Object/Widget here>>
              const Spacer(),
              TextButton(
                onPressed: (){
                  Navigator.pop(context); //this closes the overlay and uses the context given to the build()
                }, 
                child: Text('Cancel')),
              ElevatedButton(
                onPressed: _saveExpenseData, 
                child: Text('Save Expense')),
            ],
          )
        ],
      ),
    );
  }
}