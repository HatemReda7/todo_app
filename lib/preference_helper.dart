import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper{
  static late SharedPreferences prefs;

  static int? getPreviousScore(){
    return prefs.getInt("Previous Score");
  }

  static savePreviousScore(int prevScore)async{
    await prefs.setInt("Previous Score", prevScore);
  }

  static int? getPreviousNumOfQuestions(){
    return prefs.getInt("Previous Num Of Questions");
  }

  static savePreviousNumOfQuestions(int num)async{
    await prefs.setInt("Previous Num Of Questions", num);
  }

  static int? getCurrentNumOfQuestions(){
    return prefs.getInt("Current Num Of Questions");
  }

  static saveCurrentNumOfQuestions(int num)async{
    await prefs.setInt("Current Num Of Questions", num);
  }

  static saveCurrentScore(int currentScore)async{
    await prefs.setInt("Current Score", currentScore);
  }

  static int? getCurrentScore(){
    return prefs.getInt("Current Score");
  }
}