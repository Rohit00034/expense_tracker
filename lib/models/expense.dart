import 'package:uuid/uuid.dart';
const uuid=Uuid();
class Expense {
  Expense({
    required this.title,
    required this.amount,
    required this.date,
  }): id = uuid.v4(); //this : is an initializer list which is used to intialize properties which are not initialized by constructor arguments
  final String id;
  final String title;
  final double amount;
  final DateTime
  date; //DateTime here is a built-in data type in dart which allows us to use dates
}
