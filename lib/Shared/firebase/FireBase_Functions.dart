import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Models/Task_Model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTaskCollection() {
    return FirebaseFirestore.instance
        .collection("Tasks")
        .withConverter<TaskModel>(
      fromFirestore: (snapshot, _) {
        return TaskModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
  }

  static void addTask(TaskModel taskModel) {
    var collection = getTaskCollection();
    var docRef = collection.doc();
    taskModel.id = docRef.id;
    docRef.set(taskModel);
  }

  static void deleteTask(String id) {
    getTaskCollection().doc(id).delete();
  }

  static void editTask(TaskModel task) {
    getTaskCollection().doc(task.id).update(task.toJson());
  }

  static Stream<QuerySnapshot<TaskModel>> getTasks(DateTime dateTime) {
    return getTaskCollection()
        .where("date",
            isEqualTo: DateUtils.dateOnly(dateTime).millisecondsSinceEpoch)
        .orderBy("title")
        .snapshots();
  }

  static Future<void> createUser(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  static login(String email, String password,Function onSuccess,Function onError) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if(credential.user?.uid !=null){
        onSuccess;
      }
    } on FirebaseAuthException catch (e) {
      onError(e.message);
      // // if (e.code == 'user-not-found') {
      // //   onError(e.message);
      // //   print('No user found for that email.');
      // // } else if (e.code == 'wrong-password') {
      // //   onError(e.message);
      // //   print('Wrong password provided for that user.');
      // }
    }
  }
}
