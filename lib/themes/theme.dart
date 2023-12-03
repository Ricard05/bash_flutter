import 'package:flutter/material.dart';

class AppThemes {
  //variable global para colocar el color primario
  static const Color primary = Colors.teal;
  static const Color secondary = Colors.white;

  // ignore: non_constant_identifier_names
  static final ThemeData ThemeApp = ThemeData(
    primarySwatch: Colors.teal,
    scaffoldBackgroundColor: Colors.white,
    
    //Input themes
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primary),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
      )
    ),
  );
}