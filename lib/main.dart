import 'package:flutter/material.dart';
import 'package:expense_tracker/expenses.dart';

// var kColorScheme= ColorScheme.fromSeed(seedColor: Color(0xFFB0B0B0) );//the colorScheme could also be created from scratch but we can use the fromSeed() method here which allows the flutter to theme the app around a single color provided.the word k here is just a naming convention in flutter for global variables specially for themes
var kColorScheme= const ColorScheme(brightness: Brightness.dark, primary: Color(0xFF828282), onPrimary: Color(0xFFFFFFFF), secondary: Color(0xFF919191), onSecondary: Color(0xFFFFFFFF), error: Color(0xFFB00020), onError: Color(0xFFFFFFFF), surface: Color(0xFF4D4C4C), onSurface: Color(0xFFD1D1D1), primaryContainer: Color(0xFFB6B4B4), onPrimaryContainer: Color(0xFF4D4C4C), secondaryContainer: Color(0xFFD1D1D1), onSecondaryContainer: Color(0xFF4D4C4C));
void main() {
  runApp(
    MaterialApp(
      /*materialApp widget does alot of various work behind the scenes but this is also a central place to change the theme 
     of the app,meaning changing the colors the style all from one plcae rather than configuring each widget and copying pasting colors 
     across the code,this could be done by using the ThemeData class in the theme key paramenter.Flutter by default has some theme set
     and if we directly use the ThemeData rather than using the copywith() method then it means that we have to style/theme our app all
     from the scratch removing all those deafault flutter themeing done across the app */
      theme: ThemeData().copyWith(
        // elevatedButtonTheme: ElevatedButtonThemeData(), we can also theme individual widgets just like this button here
        // scaffoldBackgroundColor: Color(0xFF7D7D7D),
        colorScheme: kColorScheme,//the colorScheme here takes a color scheme and flutter applies that scheme through the app saving us manual work and time of individually setting colors here for app widgets/background
        
      ), //so this is one central place even if we have multiple scafflod instances across app all of them get changed from here
      /* theme: ThemeData(useMaterial3: true), //added to use material3 no idea right now of what it is but it is for themeing ,by default 
      flutter now uses material3 and there is no need to enable it manually*/
      home: Expenses(),
    ),
  );
}
