import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.blue,
      fontSize: 20,
    ),
  ),
  tabBarTheme: const TabBarTheme(
    unselectedLabelColor: Colors.grey,
    labelStyle: TextStyle(
      color: Colors.blueAccent,
    ),
    indicatorColor: Colors.blueAccent,
  ),
  brightness: Brightness.dark,
);
