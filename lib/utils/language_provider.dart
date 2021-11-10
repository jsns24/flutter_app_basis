import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LanguageProvider extends ChangeNotifier {
  Locale _appLocale = const Locale('en');

  Locale get appLocal => _appLocale;
  
  fetchLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langCode = prefs.getString("languageCode");

    if (langCode == null) {
      // could do some kind of checking for wheater the device language is supported here
      // using english as default language
      _appLocale = const Locale("en");

    } else {
      _appLocale = Locale(langCode);
    }
    return Null;
  }

  void setLanguage(Locale locale) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("languageCode", locale.languageCode);
    _appLocale = locale;
    notifyListeners();
  }

  List<Locale> supportedLanguages = const [
    Locale("en"),
    Locale("de"),
    Locale("ar")
  ]; 
}