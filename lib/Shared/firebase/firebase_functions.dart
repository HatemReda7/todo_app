import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:islami_app/Models/question_model.dart';

import '../../Models/quiz_model.dart';

class FirebaseFunctions {

  static CollectionReference<QuestionModel> getQuestionCollection(){
    return FirebaseFirestore.instance.collection("Questions").withConverter<QuestionModel>(
      fromFirestore: (snapshot, _) {
        return QuestionModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },);
  }

  static CollectionReference<QuizModel> getQuizCollection(){
    return FirebaseFirestore.instance.collection("Quizes").withConverter<QuizModel>(
      fromFirestore: (snapshot, _) {
        return QuizModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },);
  }

  static void addScore(QuizModel quiz){
    var collection= getQuizCollection();
    var docRef= collection.doc();
    quiz.id=docRef.id;
    docRef.set(quiz);
  }

  static Stream<QuerySnapshot<QuizModel>> getQuizzes(){
    return getQuizCollection().snapshots();
  }

  static void addQuestion(QuestionModel questionModel) {
    var collection= getQuestionCollection();
    var docRef= collection.doc();
    questionModel.id=docRef.id;
    docRef.set(questionModel);
  }

  static void deleteQuestion(String id){
    getQuestionCollection().doc(id).delete();
  }

  static Stream<QuerySnapshot<QuestionModel>> getQuestion(){
    return getQuestionCollection().snapshots();
  }
}