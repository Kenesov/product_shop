import 'package:flutter/material.dart';

class LocalizationProvider extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = const Locale('en');
    notifyListeners();
  }
}

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('uz'),
    const Locale('ru'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'uz':
        return 'Uzbekistan';
      case 'ru':
        return 'Russia';
      case 'en':
      default:
        return 'United States';
    }
  }
}