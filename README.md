
# flutter_basis_app

## localized language & color theme

This application is a basis for your flutter app with localized language and color theme support

You can just clone this project and continue working with it. 
Everything from colors to supported languages and their content is fully customable. 

# getting started  
1. to get stared just clone this reposetory and run flutter pub get to install all needed dependencies from the pubspec.yaml file

2. replace the MyHomePage Widget by your application 

3. nearly done ... now you can use the language and theme as shown in the MyHomepage widget

4. (you can delete the github_images folder)


# Color Theme

You can change the theme colors in the ThemeProvider class. 

To access the colors use Theme.of(context) (example: Theme.of(context).scaffoldBackgroundColor)

The chosen theme setting will be saved in shared preferences and used again when the app gets restared.
Thanks to the ChangeNotifier, the app will immediately change its theme whether the system theme or the theme in the app has been changed.

Modes: System, Light, Dark


# Language

The language files are stored in assets/language. You can modify the files as you want, just do not modify in guis/settings the colortheme and language, as both are needed for the given settings screens.

## add a language:

  1. create a new json file named with the language shortcut (you can use them from here: https://www.science.co.il/language/Codes.php code 2)
  2. add in the LanguageProvider class the Locale (also with the language code) to the supportedLanguages List
  3. open the language_screen file and add the language shortcut and the language code to the languageCodes Map 
  4. (please note that is necessary to have in every file the same keys)

## access the text as string 
You can access your text as a string with Language.of(context).translate(path). 
The path are the json keys to your String, separated with "/".

Example: Language.of(context).translate("guis/home/title") will give you a String of "welcome" (if the language is english of course)


If the requested String is null, the given String will be "fff". So keep your eyes open for that. 

## sample 
If you are changing the language with the given language_screen, the UI will instantly rebuild with the new language. 

Your chosen language gets saved in shared preferences to get used again when restarting the application.

If you chose a language like arab that reads from right to left the whole UI will automatically shift.
(The arab in the example is translated using google translate as I don't speak any arab, but I want to show the shift)


english: 
![Alt text](/github_images/language_english_homescreen.png?raw=true "home screen")

german:
![Alt text](/github_images/language_german_languagescreen.png?raw=true "language settings screen")

arab:
![Alt text](/github_images/language_arab_themescreen.png?raw=true "color theme screen")


# note
I created this project as a fun side project to reuse the code for futures projects.