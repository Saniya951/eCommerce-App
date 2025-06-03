import 'package:flutter/material.dart';

class SBottomSheetTheme {
  SBottomSheetTheme._();

  //showModalBottomSheet() creates a modal bottom sheet.
  // It slides up, darkens the background, and blocks interaction with the rest of the screen until closed.
  // Modal	UI -  that blocks the rest of the app (must dismiss to continue).
  // BottomSheetThemeData	- A Flutter built-in class to define how bottom sheets look app-wide.
  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    // showOraghandle: true,
    backgroundColor: Colors.white,
    modalBackgroundColor: Colors.white,
    constraints: const BoxConstraints(minWidth: double.infinity),//Forces the sheet to take up full width
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );



  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    // showOraghandle: true,
    backgroundColor: Colors.black,
    modalBackgroundColor: Colors.black,
    constraints: const BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  );


}
