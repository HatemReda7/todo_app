import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper{
  static late SharedPreferences prefs;

  static String? getLanguage(){
    return prefs.getString("Language");
  }

  static saveLanguage(String lang)async{
    await prefs.setString("Language", lang);
  }

  static saveTheme(String theme)async{
    await prefs.setString("Theme", theme);
  }

  static String? getTheme(){
    return prefs.getString("Theme");
  }
}