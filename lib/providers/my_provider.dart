import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  int quizScore=0;

  void init()async{
    changeScore(0);

  }

  void changeScore(int score){
    quizScore=score;
    notifyListeners();
  }
}