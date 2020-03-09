import 'package:flutter/material.dart';
import 'package:bethriftytoday/config/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeOptions { light, dark, amoled }

class SettingsProvider extends ChangeNotifier {
  Color accentColor;
  ThemeOptions themePref;
  bool biometricsEnabled;

  SettingsProvider() {
    accentColor = thriftyBlue;
    biometricsEnabled = false;
    themePref = ThemeOptions.light;
  }

  setAccentColor(Color color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('accentColor', color.value);
    accentColor = color;
    notifyListeners();
  }

  setTheme(ThemeOptions themeOption) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('themePref', themeOption.index);
    themePref = themeOption;
    notifyListeners();
  }

  setBiometricsEnabled(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('biometricsEnabled', value);
    biometricsEnabled = value;
    notifyListeners();
  }
}
