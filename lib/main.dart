import 'package:flutter/material.dart';
import 'package:expense_tracker/expenses.dart';

// var kColorScheme= ColorScheme.fromSeed(seedColor: Color(0xFFB0B0B0) );//the colorScheme could also be created from scratch but we can use the fromSeed() method here which allows the flutter to theme the app around a single color provided.the word k here is just a naming convention in flutter for global variables specially for themes
var kColorScheme= const ColorScheme(brightness: Brightness.light, primary: Color(0xFF828282), onPrimary: Color(0xFFFFFFFF), secondary: Color(0xFF919191), onSecondary: Color(0xFFFFFFFF), error: Color(0xFFB00020), onError: Color(0xFFFFFFFF), surface: Color(0xFF4D4C4C), onSurface: Color(0xFFD1D1D1), primaryContainer: Color(0xFFB6B4B4), onPrimaryContainer: Color(0xFF4D4C4C), secondaryContainer: Color(0xFFD1D1D1), onSecondaryContainer: Color(0xFF4D4C4C));
var kdarkColorScheme= ColorScheme.fromSeed(brightness: Brightness.dark/*shows that this is a dark mode color scheme */,seedColor: const Color.fromARGB(255, 150, 139, 128));
void main() {
  runApp(
    MaterialApp(
      /*materialApp widget does alot of various work behind the scenes but this is also a central place to change the theme 
     of the app,meaning changing the colors the style all from one plcae rather than configuring each widget and copying pasting colors 
     across the code,this could be done by using the ThemeData class in the theme key paramenter.Flutter by default has some theme set
     and if we directly use the ThemeData rather than using the copywith() method then it means that we have to style/theme our app all
     from the scratch removing all those deafault flutter themeing done across the app */
     darkTheme: ThemeData.dark().copyWith( //this is used to define the dark theme in our app but since our app is already minmalistic and dark we dont need this
      colorScheme: kdarkColorScheme,
      cardTheme:const CardThemeData().copyWith(
          color:  const Color.fromARGB(255, 219, 216, 216),
          elevation: 7,
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        ),
     ),
      theme: ThemeData().copyWith(  //this is for the light theme 
        // elevatedButtonTheme: ElevatedButtonThemeData(), we can also theme individual widgets just like this button here
        // scaffoldBackgroundColor: Color(0xFF7D7D7D),
        colorScheme: kColorScheme,//the colorScheme here takes a color scheme and flutter applies that scheme through the app saving us manual work and time of individually setting colors here for app widgets/background
        cardTheme:const CardThemeData().copyWith(
          color:  const Color.fromARGB(255, 219, 216, 216),
          elevation: 7,
          margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData( //the ElevatedButtonThemeData() does not have a copyWith() constructor but here we are using the ElevatedButton.styleFrom() which also uses the default flutter styling ,so it is an alternative for the ones who do not have a copyWith()
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: const Color.fromARGB(255, 92, 89, 89),
          )),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              backgroundColor:  kColorScheme.primaryContainer ,
              foregroundColor:const Color.fromARGB(255, 92, 89, 89), 
              ),),
          textTheme: ThemeData().textTheme.copyWith( //this ensure that we are overriding the textTheme of the ThemeData object
           titleLarge: TextStyle( //this titleLarge type of text is used in the appBar and here if i change the foreground color of appbar in the appbarTheme then it will override this color that we set here 
            fontWeight: FontWeight.bold,
            color: kColorScheme.primary  
           ) 
          )    

      ), //so this is one central place even if we have multiple scafflod instances across app all of them get changed from here
      /* theme: ThemeData(useMaterial3: true), //added to use material3 no idea right now of what it is but it is for themeing ,by default 
      flutter now uses material3 and there is no need to enable it manually*/
      themeMode: ThemeMode.light, //this is set by deafult to ThemeMode.system but we can force our app to run in light or dark by using this
      
      home: Expenses(),
    ),
  );
}
