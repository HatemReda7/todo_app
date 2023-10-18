import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Models/Task_Model.dart';

class FirebaseFunctions {

  static CollectionReference<TaskModel> getTaskCollection(){
    return FirebaseFirestore.instance.collection("Tasks").withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },);
  }

  static void addTask(TaskModel taskModel) {

    var collection= getTaskCollection();
    var docRef= collection.doc();
    taskModel.id=docRef.id;
    docRef.set(taskModel);
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime dateTime){
    return getTaskCollection().where("date",isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch).orderBy("title").snapshots();
  }
}