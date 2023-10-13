import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme;
  final SharedPreferences _prefs;
  String _selectedThemeOption; // Updated to store the selected theme option
  static const String _themeKey = 'theme';
  static const String _selectedThemeOptionKey = 'selectedThemeOption';

  ThemeNotifier(this._currentTheme, this._prefs)
      : _selectedThemeOption = 'System' {
    _initSelectedThemeOption();
  }

  ThemeData get currentTheme => _currentTheme;
  String get selectedThemeOption => _selectedThemeOption;

  Future<void> _initSelectedThemeOption() async {
    final String? selectedThemeOptionFromPrefs =
    _prefs.getString(_selectedThemeOptionKey);
    if (selectedThemeOptionFromPrefs != null) {
      _selectedThemeOption = selectedThemeOptionFromPrefs;
    }
    notifyListeners();
  }

  // Method to get the selected theme number
  String getSelectedThemeNumber() {
    return _selectedThemeOption;
  }

  Future<void> setTheme(ThemeData theme) async {
    _currentTheme = theme;
    notifyListeners();
    await _prefs.setInt(
        _themeKey, theme == ThemeData.light() ? 0 : 1); // Store the theme mode
  }

  Future<void> loadTheme() async {
    final int themeIndex = _prefs.getInt(_themeKey) ?? 0;
    _currentTheme = themeIndex == 0 ? ThemeData.light() : ThemeData.dark();
    notifyListeners();
  }

  Future<void> setSelectedThemeOption(String option) async {
    _selectedThemeOption = option;
    notifyListeners();
    await _prefs.setString(_selectedThemeOptionKey, option); // Store the selected theme option
  }

  Future<void> loadSelectedThemeOption() async {
    _selectedThemeOption = _prefs.getString(_selectedThemeOptionKey) ??
        'System'; // Load the selected theme option
    notifyListeners();
  }
}
