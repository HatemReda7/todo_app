import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
          height: 50.h,
          width: 220.w,
          margin: EdgeInsets.symmetric(horizontal: 70.w,vertical: 50.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(12)),
          child: Text("Current Score:  ${pro.quizScore}/${pro.numOfQuestions} ",style: GoogleFonts.poppins(
              color: Theme.of(context).indicatorColor,
              fontWeight: FontWeight.w700,
              fontSize: 18.sp)),
        ),
        Container(
          height: 50.h,
          width: 220.w,
          margin: EdgeInsets.symmetric(horizontal: 70.w,vertical: 50.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.circular(12)),
          child: Text("Previous Score:  ${pro.previousScore}/${pro.previousNumOfQuestions} ",style: GoogleFonts.poppins(
              color: Theme.of(context).indicatorColor,
              fontWeight: FontWeight.w700,
              fontSize: 18.sp)),
        ),
      ],
    );
  }
}
