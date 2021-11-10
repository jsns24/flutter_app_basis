import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_basis/utils/language_provider.dart';


class Language {
  final Locale locale;
  Language(this.locale);

  static const LocalizationsDelegate<Language> delegate = _LanguageDelegate();
  late Map<String, dynamic> _localizedStrings;

  static Language of(BuildContext context) {
    return Localizations.of<Language>(context, Language) ?? Language(const Locale("en"));
  }

  Future<bool> loadBundle() async {
    String jsonString =
    await rootBundle.loadString('assets/language/${locale.languageCode}.json');
    _localizedStrings= json.decode(jsonString);
    return true;
  }

  String translate(String key) {
    List<String> subtrees = key.split("/");
    Map<String, dynamic> tree = _localizedStrings;
    for (int i = 0; i < subtrees.length - 1; i++) {
      tree = tree[subtrees[i]];
    }
    return tree[subtrees[subtrees.length - 1]] ?? "fff";
  }
}


class _LanguageDelegate extends LocalizationsDelegate<Language> {
  const _LanguageDelegate();

  @override
  bool isSupported(Locale locale) {
    return LanguageProvider().supportedLanguages.contains(locale);
  }

  @override
  Future<Language> load(Locale locale) async {
    Language localizations = Language(locale);
    await localizations.loadBundle();
    return localizations;
  }

  @override
  bool shouldReload(_LanguageDelegate old) => false;
}