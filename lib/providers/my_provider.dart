import 'package:flutter/material.dart';
import 'package:islami_app/preference_helper.dart';

class MyProvider extends ChangeNotifier{
  String languageCode="en";
  ThemeMode themeMode=ThemeMode.light;

  void init()async{
    String? newLang= PrefsHelper.getLanguage();
    changeLanguage(newLang??"en");
    String mode= PrefsHelper.getTheme()??"light";
    if(mode == "light"){
      changeTheme(ThemeMode.light);
    }else{
      changeTheme(ThemeMode.dark);
    }
  }

  void changeLanguage(String lang){
    languageCode=lang;
    PrefsHelper.saveLanguage(lang);
    notifyListeners();
  }

  void changeTheme(ThemeMode theme){
    themeMode=theme;
    if(theme == ThemeMode.light){
      PrefsHelper.saveTheme("light");
    }else{
      PrefsHelper.saveTheme("dark");
    }
    notifyListeners();
  }
}