import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;
  AppTheme({ThemeMode mode = ThemeMode.light}) : _themeMode = mode;

  void changeTheme() {
    _themeMode =
        themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
