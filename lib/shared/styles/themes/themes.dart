import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'Jannah',
  primarySwatch: Colors.teal,
  appBarTheme: AppBarTheme(
     // centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backwardsCompatibility: false,
      color: Colors.teal,
      elevation: 0.0),
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.black,
  textTheme: TextTheme(
    subtitle1: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Colors.white),
    bodyText2: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.white),
    subtitle2: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
      color: Colors.white,
    ),
    bodyText1: TextStyle(
      height: 1.5,
      color: Colors.white,
      /*shadows: [
                      Shadow(
                        offset: Offset(0.0,15),
                        color:Colors.black,
                        blurRadius: 40,
                      ),
                    ],*/
      fontWeight: FontWeight.bold,
      fontSize: 15,
    ),
  ),
  /* bottomNavigationBarTheme: BottomNavigationBarThemeData(
               elevation: 0.0,
               selectedItemColor: Colors.black,
               unselectedItemColor: Colors.grey,
             ),*/
  tabBarTheme: TabBarTheme(
      labelColor: Colors.black, unselectedLabelColor: Colors.black),
);
ThemeData lightTheme = ThemeData(
  fontFamily: 'Jannah',
  primarySwatch: Colors.teal,
  appBarTheme: AppBarTheme(
    //  centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      backwardsCompatibility: false,
      color: Colors.teal,
      elevation: 0.0),
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  textTheme: TextTheme(
    bodyText2: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black),
    subtitle1: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Colors.black),
    subtitle2: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 10,
      color: Colors.black,
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      /*shadows: [
                    Shadow(
                      offset: Offset(0.0,15),
                      color:Colors.white,
                      blurRadius: 40,
                    ),
                  ],*/
      fontWeight: FontWeight.w900,
      fontSize: 16,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0.0,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
  ),
  tabBarTheme: TabBarTheme(
      labelColor: Colors.black, unselectedLabelColor: Colors.black),
);
