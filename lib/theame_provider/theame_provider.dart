import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
    // elevatedButtonTheme: const ElevatedButtonThemeData(style: ButtonStyle()),
    useMaterial3: true,
    brightness: Brightness.light,
    primarySwatch: Colors.indigo,
    accentColor: Colors.green,
    scaffoldBackgroundColor: Colors.white);

ThemeData dark = ThemeData(
    // typography: Typography(),
    cardColor: Colors.white,
    // textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.black)),
    cardTheme: const CardTheme(elevation: 10),
    useMaterial3: true,
    brightness: Brightness.dark,
    primarySwatch: Colors.indigo,
    accentColor: Colors.green,
    scaffoldBackgroundColor: Colors.orange.shade50);

class ThemeNotifier extends ChangeNotifier {
  final String key = 'theme';

  bool darkTheme = false;

  ThemeNotifier() {
    darkTheme = false;
    getBool();
  }

  toggleTheme() {
    darkTheme = !darkTheme;
    setBool();
    notifyListeners();
  }

  getBool() async {
    final prefs = await SharedPreferences.getInstance();
    darkTheme = prefs.getBool(key)!;
    notifyListeners();
  }

  setBool() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setBool(key, darkTheme);
  }
}
