import 'package:flutter/material.dart';
import 'package:flutter_app_basis/utils/language_provider.dart';
import 'package:flutter_app_basis/utils/language.dart';
import 'package:provider/provider.dart';

// fully functional screen
// implement wherever you want into your app

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Language.of(context).translate("guis/settings/language/title"),
        ),
      ),
      body: Column(
        children: <Widget>[
          for (Locale locale in LanguageProvider().supportedLanguages) _buildItem(locale: locale)
        ],
      )
    );
  }

  Widget _buildItem({required Locale locale}) {
    return Container(
      padding: const EdgeInsets.only(right: 12),
      color: Theme.of(context).scaffoldBackgroundColor,
      width: double.infinity,
      height: 50,
      child: TextButton(
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Text(
                languageCodes[locale.languageCode] ?? "", 
                textAlign: TextAlign.left,
              ),
              const Spacer(),
              locale == Provider.of<LanguageProvider>(context).appLocal ? const Icon(
                Icons.check_rounded,
              ) : Container()
            ]
          )
        ),
        onPressed: () {
          Provider.of<LanguageProvider>(context, listen: false).setLanguage(locale);
          setState(() {});
        }
      ),
    );
  }
}

final Map<String, String> languageCodes = {
  "en": "english",
  "de": "Deutsch",
  "ar": "عربي",
};