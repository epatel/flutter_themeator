import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = .system;

  ThemeMode get themeMode => _themeMode;

  bool get isDark => _themeMode == .dark;

  void toggleTheme() {
    _themeMode = _themeMode == .light ? .dark : .light;
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
