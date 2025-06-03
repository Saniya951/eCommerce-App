import 'package:flutter/material.dart';

class SAppBarTheme {
  SAppBarTheme._();

  //The member belongs to the class itself, not to an instance of the class.
  // So you can use the member without creating an object of the class.
  //Because it's static, it's globally accessible. ->>>> SChipTheme.lightChipTheme; // ✅
  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false, //Title is left-aligned
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size:24),
    actionsIconTheme: IconThemeData(color: Colors.black, size:24),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color:Colors.black),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.white, size:24),
    actionsIconTheme: IconThemeData(color: Colors.white, size:24),
    titleTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600, color:Colors.white),
  );
}
