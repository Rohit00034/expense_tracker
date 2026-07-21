import 'package:uuid/uuid.dart';
const uuid=Uuid();
enum Category {food,travel,leisure,work} //this is an enum,unlike c++ these values are not contant integers ,an enum is a user defined datatype to make fixed set of allowed values 
class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }): id = uuid.v4(); //this : is an initializer list which is used to intialize properties which are not initialized by constructor arguments
  final String id;
  final String title;
  final double amount;
  final DateTime
  date; //DateTime here is a built-in data type in dart which allows us to use dates
  final Category category; //an object of category
}
