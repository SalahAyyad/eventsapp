import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {

ThemeMode AppTheme = ThemeMode.light;

void changeTheme(ThemeMode newTheme) {

if (AppTheme == newTheme) {
  return;
}
  AppTheme = newTheme;
  notifyListeners();

  

}
}