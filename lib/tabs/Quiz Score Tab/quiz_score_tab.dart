import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Models/quiz_model.dart';
import 'package:islami_app/preference_helper.dart';
import 'package:islami_app/tabs/Quiz%20Score%20Tab/quiz_score_item.dart';
import 'package:provider/provider.dart';
import '../../Shared/firebase/firebase_functions.dart';
import '../../providers/my_provider.dart';

class QuizScoreTab extends StatelessWidget {
  static const String routeName= "Quiz Score Tab";

  const QuizScoreTab({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 175.h,
          width: 300.w,
          padding: EdgeInsets.all(10.r),
          margin: EdgeInsets.symmetric(vertical: 20.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Current Score:  ${pro.quizScore}/${pro.numOfQuestions} ",style: GoogleFonts.poppins(
                  color: Theme.of(context).indicatorColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp)),
              SizedBox(height: 10.h,),
              Text("Total Number Of Correct Answers:  ${pro.totalNumOfCorrectAnswers} ",style: GoogleFonts.poppins(
                  color: Theme.of(context).indicatorColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp)),
              SizedBox(height: 10.h,),
              Text("Total Number Of Questions:  ${pro.totalNumOfQuestions} ",style: GoogleFonts.poppins(
                  color: Theme.of(context).indicatorColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp)),
            ],
          ),
        ),
        StreamBuilder(stream: FirebaseFunctions.getQuizzes(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Something went wrong",
                style: TextStyle(color: Colors.white),));
            }
            List<QuizModel> quizzes = snapshot.data?.docs.map((e) => e.data())
                .toList() ?? [];
            return Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return QuizScoreItem(quizModel: quizzes[index],);
              }, itemCount: quizzes.length,),
            );
          },
        )
      ],
    );
  }
}
