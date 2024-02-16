import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Models/question_model.dart';
import 'package:islami_app/Shared/firebase/FireBase_Functions.dart';
import 'package:provider/provider.dart';
import '../../Shared/styles/colors.dart';
import '../../providers/my_provider.dart';

class QuizItem extends StatefulWidget {
  final QuestionModel question;
  final int index;
  final bool isCorrect;
  const QuizItem({super.key, required this.question,required this.index,this.isCorrect=false});

  @override
  State<QuizItem> createState() => _QuizItemState();
}

class _QuizItemState extends State<QuizItem> {
  var answerController = TextEditingController();
  int correctAnswerCounter=0;
  bool correctAnswer=false;
  bool wrongAnswer=false;
  int wrongAnswerCounter=0;

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text("${widget.index+1}- ${widget.question.question}",style: GoogleFonts.poppins(
                  color: correctAnswer? Colors.green: wrongAnswer?Colors.red: Theme.of(context).indicatorColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp),),
              SizedBox(width: 200.w,),
              correctAnswer?Icon(Icons.check,color:Colors.green,size: 35.sp,):const SizedBox.shrink(),
              wrongAnswer? Icon(Icons.clear_rounded,color: Colors.red,size: 35.sp,):const SizedBox.shrink()
            ],
          ),
          SizedBox(height: 15.h,),
          TextFormField(
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (value) {
              if(value == widget.question.answer){
                correctAnswer=true;
                correctAnswerCounter+=1;
                pro.quizScore+=1;
              }
              else if(value != widget.question.answer){
                wrongAnswer=true;
                wrongAnswerCounter+=1;
              }
              setState(() {

              });
            },
            style: GoogleFonts.inter(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp),
            controller: answerController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: correctAnswer? Colors.green: wrongAnswer? Colors.red: primary,width: 2.w),
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
