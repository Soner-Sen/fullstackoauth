import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');
  Locale get locale => _locale;

  LocaleProvider() {
    _loadLocale();
  }

  void _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final String languageCode = prefs.getString('languageCode') ?? 'en';
    setLocale(Locale(languageCode));
  }

  setLocale(Locale locale) async {
    if (!['en', 'de'].contains(locale.languageCode)) return;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', locale.languageCode);

    _locale = locale;
    notifyListeners();
  }
}
