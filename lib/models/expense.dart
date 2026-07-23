import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';  //package to generate universally unique identifier
import 'package:intl/intl.dart'; //package used here for formatting the date but is also used for localization and internationalization
const uuid=Uuid();
final formatter=DateFormat.yMd();//here like yMd() there are multiple constructore to format date 
enum Category {food,travel,leisure,work} //this is an enum,unlike c++ these values are not contant integers ,an enum is a user defined datatype to make fixed set of allowed values 
const categoryIcons ={
 Category.food : Icons.lunch_dining,
 Category.travel : Icons.flight_takeoff,
 Category.leisure : Icons.movie,
 Category.work : Icons.work
};
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
  String get formattedDate{ //this is a getter works just like function as seen before but only for when returning data
    return formatter.format(date); 
  }
}
