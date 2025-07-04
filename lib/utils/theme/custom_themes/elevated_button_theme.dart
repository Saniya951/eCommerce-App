import 'package:flutter/material.dart';

class SElevatedButtonTheme {
  SElevatedButtonTheme._();

  //light theme
  //You can’t use const here because Colors.blue[600] is a runtime lookup from a map (internally a material color swatch), which is not known at compile time.therefore use final
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style:ElevatedButton.styleFrom(
      elevation:0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue[600],
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Colors.blue),
      padding: const EdgeInsets.symmetric(vertical:18),
      textStyle: const TextStyle(fontSize: 16, color:Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style:ElevatedButton.styleFrom(
      elevation:0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue[600],
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Colors.blue),
      padding: const EdgeInsets.symmetric(vertical:18),
      textStyle: const TextStyle(fontSize: 16, color:Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}
