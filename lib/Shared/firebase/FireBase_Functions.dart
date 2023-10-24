import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Models/Task_Model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:islami_app/Models/User_Model.dart';

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

  static Future<void> addUserToFirestore(UserModel userModel){
    var collection= getUserCollection();
    var docRef= collection.doc(userModel.id);
    return docRef.set(userModel);
  }

  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection("Users")
        .withConverter<UserModel>(
      fromFirestore: (snapshot, _) {
        return UserModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, _) {
        return value.toJson();
      },
    );
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

  static Future<void> createUser(String email, String password,String name,int age,Function onSuccess,Function onError) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if(credential.user?.uid !=null){
        UserModel user=UserModel(id: credential.user!.uid, name: name, email: email, age: age);
        addUserToFirestore(user).then((value) {
          onSuccess();
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        onError(e.message);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        onError(e.message);
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
        var user= await readUserFromFirestore(credential.user!.uid);
        onSuccess(user);
      }
    } on FirebaseAuthException catch (e) {
      //onError("Wrong Email or Password!");
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

  static Future<UserModel?> readUserFromFirestore(String id)async{
    DocumentSnapshot<UserModel> doc= await
    getUserCollection().doc(id).get();
    return doc.data();
  }
}

