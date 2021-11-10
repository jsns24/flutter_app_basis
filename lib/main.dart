import 'package:flutter/material.dart';
import 'package:flutter_app_basis/utils/language.dart';
import 'package:flutter_app_basis/utils/language_provider.dart';
import 'package:flutter_app_basis/utils/theme_provider.dart';
import 'package:flutter_app_basis/views/settings/colortheme_screen.dart';
import 'package:flutter_app_basis/views/settings/language_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  LanguageProvider appLanguage = LanguageProvider();
  await appLanguage.fetchLocale();
  runApp(
    MobileApp(appLanguage: appLanguage)
  );
}

class MobileApp extends StatelessWidget {
  final LanguageProvider appLanguage;
  const MobileApp({required this.appLanguage, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(create: (context) =>  ThemeProvider()),
      ChangeNotifierProvider<LanguageProvider>(create: (context) =>  appLanguage)
    ],
    builder: (context, builder) {
      final themeProvider = Provider.of<ThemeProvider>(context);
      final languageProvider = Provider.of<LanguageProvider>(context);
      return MaterialApp(
        title: 'SetupApp',
        theme: themeProvider.lightTheme,
        darkTheme: themeProvider.darkTheme,
        themeMode: themeProvider.themeMode,
        
        locale: languageProvider.appLocal,
        localizationsDelegates: const [
          Language.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: LanguageProvider().supportedLanguages,

        home: const MyHomePage(title: "Flutter App Basis",),
      );
    }
  );
}


// replace MyHomePage with your own application 
// you can link to the settings screens wherever you want to in your app
// the widget below is an example on how to use this basis
class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // static text that won't be translated 
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        // all texts are loaded in the selected language
        children: <Widget>[
          Text(
            Language.of(context).translate("guis/home/title"),
            style: const TextStyle(
              fontSize: 22,
              // color: Theme.of(context).scaffoldBackgroundColor
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            Language.of(context).translate("guis/home/purpose"),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 20,),
          Text(
            Language.of(context).translate("guis/home/message"),
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 6),
          TextButton(
            child: Text(Language.of(context).translate("guis/home/navigation/colortheme"),),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ColorThemeScreen()),
              );
            },
          ),
          TextButton(
            child: Text(Language.of(context).translate("guis/home/navigation/language"),),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LanguageScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}