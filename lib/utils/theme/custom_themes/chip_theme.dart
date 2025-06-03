import 'package:flutter/material.dart';

class SChipTheme {
  SChipTheme._();

  //(toggled on)
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withAlpha((0.4 * 255).toInt()),
    labelStyle:const TextStyle(color: Colors.black),
    selectedColor: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal:12.0, vertical: 12),
    checkmarkColor: Colors.white,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withAlpha((0.4 * 255).toInt()),
    labelStyle:const TextStyle(color: Colors.white),
    selectedColor: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal:12.0, vertical: 12),
    checkmarkColor: Colors.white,
  );

}
