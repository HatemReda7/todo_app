import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:islami_app/Models/quiz_Model.dart';

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

  static void addQuestion(QuestionModel questionModel) {

    var collection= getQuestionCollection();
    var docRef= collection.doc();
    questionModel.id=docRef.id;
    docRef.set(questionModel);
  }

  static void deleteQuestion(String id){
    getQuestionCollection().doc(id).delete();
  }
  
  static void editQuestion(QuestionModel task){
    getQuestionCollection().doc(task.id).update(task.toJson());
  }

  static Stream<QuerySnapshot<QuestionModel>> getQuestion(){
    return getQuestionCollection().snapshots();
  }
}