import 'package:flutter/material.dart';

import 'package:expense_tracker/expenses.dart';

var kColorScheme =ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 59, 181),
  );
var kDarkColorScheme= ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 5, 99, 125),
  );
void main() {
  runApp(
     MaterialApp(
      darkTheme: ThemeData.dark().copyWith(useMaterial3: true,colorScheme: kDarkColorScheme,
      cardTheme: CardTheme().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(
            horizontal: 16 ,
            vertical: 8,
            ),
        ),
         elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.primaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true, 
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16 ,vertical: 8,),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(fontWeight: FontWeight.normal, color: kColorScheme.onSecondaryContainer, fontSize:20, )
        )
      ),
      themeMode: ThemeMode.system,
      home:Expenses(),
      
    ),
  );
}