import 'package:flutter/material.dart';

ThemeData lightTheme(){
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    primaryColor: Colors.black,
    primaryColorLight: Color(0xFF26235C),
    backgroundColor:Colors.white,
  );
}


ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    primaryColor: Colors.white,
    primaryColorLight: Color(0xFFA79AE0),
    backgroundColor: Color(0xFF26235C),
  );
}


class ChangeTheme extends ChangeNotifier{
  ThemeData theme = lightTheme();
  bool isdark = false;
  void changeTheme(){
    theme = isdark?lightTheme():darkTheme();
    isdark = !isdark;
    notifyListeners();
  }
}