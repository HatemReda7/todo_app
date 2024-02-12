import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Models/quiz_Model.dart';
import 'package:provider/provider.dart';
import '../../Shared/styles/Colors.dart';
import '../../providers/my_provider.dart';

class QuizItem extends StatelessWidget {
  QuestionModel question;
  int index;
  bool isCorrect;
  QuizItem({required this.question,required this.index,this.isCorrect=false});

  var answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("${index+1}- ${question.question}",style: GoogleFonts.poppins(
              color: Theme.of(context).indicatorColor,
              fontWeight: FontWeight.w700,
              fontSize: 18.sp),),
          SizedBox(height: 15.h,),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please answer this Question";
              }
              return null;
            },
            style: GoogleFonts.inter(
                color: pro.themeMode == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp),
            controller: answerController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: primary),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: primary),
              ),
              hintText: "Answer Here",
              hintStyle: GoogleFonts.inter(
                  color: const Color(0xffA9A9A9).withOpacity(.61),
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp),
            ),
          ),
        ],
      ),
    );
  }
}
