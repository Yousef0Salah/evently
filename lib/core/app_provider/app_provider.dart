import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  Locale appLocale = Locale('en');

  void changeTheme(ThemeMode theme) {
    themeMode = theme;

    notifyListeners();
  }

  void changeLanguage(String langCode) {
    appLocale = Locale(langCode);
    notifyListeners();
  }
}
