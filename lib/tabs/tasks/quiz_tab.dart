import 'package:flutter/material.dart';
import 'package:islami_app/Models/quiz_Model.dart';
import 'package:islami_app/tabs/tasks/quiz_item.dart';
import '../../Shared/firebase/FireBase_Functions.dart';

class QuizTab extends StatelessWidget {
  static const String routeName="QuizTab";
  QuizTab();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).cardColor),
      height: 770,
      child: Column(
        children: [
          StreamBuilder(stream: FirebaseFunctions.getQuestion(),
            builder: (context, snapshot) {
              List<QuestionModel> questions = snapshot.data?.docs.map((e) => e.data())
                  .toList() ?? [];
              return Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: QuizItem(question: questions[index],index: index,),
                  );
                }, itemCount: questions.length,),
              );
            },
          ),
          ElevatedButton(onPressed: () {
            Navigator.pop(context, (route) => false);
          }, child: const Text("Finish Quiz"))
        ],
      ),
    );
  }
}
