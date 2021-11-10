import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primarySwatch: Colors.blue,
  );

  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    primarySwatch: Colors.blue
  );

  ThemeProvider() {
    getPrefsThemeMode();
  }

  void getPrefsThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String prefsTheme = prefs.getString("ThemeMode") ?? "systemTheme";
    switch (prefsTheme) {
      case "systemTheme":
        themeMode =  ThemeMode.system;
        break;
      case "darkTheme":
        themeMode = ThemeMode.dark;
        break;
      case "lightTheme":
        themeMode = ThemeMode.light;
        break;
      default:
        themeMode = ThemeMode.system;
    }
    notifyListeners();
  }

  void setSystemTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("ThemeMode", "systemTheme");
    themeMode = ThemeMode.system;
    notifyListeners();
  }

  void setDarkTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("ThemeMode", "darkTheme");
    themeMode = ThemeMode.dark;
    notifyListeners();
  }

  void setLightTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("ThemeMode", "lightTheme");
    themeMode = ThemeMode.light;
    notifyListeners();
  }
}