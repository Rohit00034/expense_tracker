import 'package:flutter/material.dart';
import 'package:expense_tracker/expenses.dart';
void main(){
  runApp(
     MaterialApp(
      // theme: ThemeData(useMaterial3: true), //added to use material3 no idea right now of what it is but it is for themeing ,by default flutter now uses material3 and there is no need to enable it manually 
      home: Expenses()),
      );
}