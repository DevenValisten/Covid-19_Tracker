import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';
import 'my_theme.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _currentTheme;

  ThemeProvider({required int themeIndex}) {
    switch (themeIndex) {
      case 0:
        _currentTheme = MyTheme().lightTheme;
        break;
      case 1:
        _currentTheme = MyTheme().darkTheme;
        break;
    }
  }

  ThemeData get getTheme => _currentTheme;

  void toogleTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (_currentTheme == MyTheme().darkTheme) {
      _currentTheme = MyTheme().lightTheme;
      pref.setInt('savedTheme', 0);
    } else {
      _currentTheme = MyTheme().darkTheme;
      pref.setInt('savedTheme', 1);
    }

    notifyListeners();
  }

  void setLightTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    _currentTheme = MyTheme().lightTheme;
    pref.setInt('savedTheme', 1);
    notifyListeners();
  }

  void setDarkTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    _currentTheme = MyTheme().darkTheme;
    pref.setInt('savedTheme', 1);
    notifyListeners();
  }
}
