import 'package:flutter/material.dart';
import 'package:flutter_app_basis/utils/language.dart';
import 'package:flutter_app_basis/utils/theme_provider.dart';
import 'package:provider/provider.dart';

// fully functional screen
// implement wherever you want into your app

class ColorThemeScreen extends StatefulWidget {
  const ColorThemeScreen({Key? key}) : super(key: key);

  @override
  _ColorThemeScreenState createState() => _ColorThemeScreenState();
}

class _ColorThemeScreenState extends State<ColorThemeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Language.of(context).translate("guis/settings/colortheme/title"),
        ),
      ),
      body: Column(
        children: <Widget>[
          _buildItem(themeMode: ThemeMode.system),
          _buildItem(themeMode: ThemeMode.light),
          _buildItem(themeMode: ThemeMode.dark),
        ],
      )
    );
  }

  Widget _buildItem({required ThemeMode themeMode}) {
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
                Language.of(context).translate("guis/settings/colortheme/${themeMode.toString().substring(10)}"), 
                textAlign: TextAlign.left,
              ),
              const Spacer(),
              themeMode == Provider.of<ThemeProvider>(context).themeMode ? const Icon(
                Icons.check_rounded,
              ) : Container()
            ]
          )
        ),
        onPressed: () {
          final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
          switch (themeMode) {
            case ThemeMode.system:
              themeProvider.setSystemTheme();
              break;
            case ThemeMode.light:
              themeProvider.setLightTheme();
              break;
            case ThemeMode.dark:
              themeProvider.setDarkTheme();
              break;
            default:
              break;
          }
          setState(() {});
        }
      ),
    );
  }
}