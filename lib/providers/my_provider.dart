import 'package:flutter/material.dart';
import '../preference_helper.dart';

class MyProvider extends ChangeNotifier{
  int quizScore=0;
  int numOfQuestions=0;
  int previousNumOfQuestions=0;
  int previousScore=0;

  void init()async{
    int? currentScore= PrefsHelper.getCurrentScore();
    changeCurrentScore(currentScore??0);

    int? currentNumOfQuestions= PrefsHelper.getCurrentNumOfQuestions();
    changeCurrentNumOfQuestions(currentNumOfQuestions??0);

    int? prevScore= PrefsHelper.getPreviousScore();
    changePreviousScore(prevScore??0);

    int? prevNumOfQuestions= PrefsHelper.getPreviousNumOfQuestions();
    changePreviousNumOfQuestions(prevNumOfQuestions??0);
  }

  void changeCurrentScore(int score){
    quizScore=score;
    PrefsHelper.saveCurrentScore(score);
    notifyListeners();
  }

  void changeCurrentNumOfQuestions(int num){
    numOfQuestions=num;
    PrefsHelper.saveCurrentScore(num);
    notifyListeners();
  }

  void changePreviousNumOfQuestions(int num){
    previousNumOfQuestions=num;
    PrefsHelper.savePreviousNumOfQuestions(num);
    notifyListeners();
  }

  void changePreviousScore(int prevScore){
    previousScore=prevScore;
    PrefsHelper.savePreviousScore(prevScore);
    notifyListeners();
  }
}