import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Models/quiz_model.dart';
import '../../Shared/firebase/FireBase_Functions.dart';
import '../../providers/my_provider.dart';
import 'question_edit.dart';

class QuestionItem extends StatelessWidget {
  final QuestionModel question;
  const QuestionItem({required this.question, super.key});

  @override
  Widget build(BuildContext context) {
    var pro= Provider.of<MyProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 8.h),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        child: Slidable(
          startActionPane: ActionPane(motion: const ScrollMotion(), children: [
            SlidableAction(
              borderRadius: pro.languageCode=="en"?BorderRadius.only(topLeft: Radius.circular(15.r), bottomLeft: Radius.circular(15.r))
                  :BorderRadius.only(topRight: Radius.circular(15.r), bottomRight: Radius.circular(15.r)),
              onPressed: (context) {
                FirebaseFunctions.deleteQuestion(question.id);
              },
              backgroundColor: const Color(0xffEC4B4B),
              icon: Icons.delete,
              label: AppLocalizations.of(context)!.delete,
            ),
            // SlidableAction(
            //   borderRadius: pro.languageCode=="ar"?BorderRadius.only(topLeft: Radius.circular(15.r), bottomLeft: Radius.circular(15.r))
            //       :BorderRadius.only(topRight: Radius.circular(15.r), bottomRight: Radius.circular(15.r)),
            //   onPressed: (context) {
            //     Navigator.pushNamed(context, QuestionEdit.routeName,
            //         arguments: QuestionModel(question: question.question, answer: question.answer));
            //   },
            //   backgroundColor: Colors.blue,
            //   icon: Icons.edit,
            //   label: AppLocalizations.of(context)!.edit,
            // ),
          ]),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
            child: Row(
              children: [
                Container(
                  height: 62.h,
                  width: 4.w,
                  decoration: BoxDecoration( color: Colors.blue,
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                ),
                SizedBox(width: 20.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question.question,
                      style: GoogleFonts.poppins(
                          color: Colors.blue,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      question.answer,
                      style: GoogleFonts.poppins(
                          color: Colors.blue,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  //question.date<=DateTime.now().millisecondsSinceEpoch?Colors.red:Colors.blue;
  // Color checkColor(){
  //   if(question.isDone){
  //     return const Color(0xff61E757);
  //   }else if(question.date<=DateTime.now().subtract(const Duration(days: 1)).millisecondsSinceEpoch){
  //     return Colors.red;
  //   }else{
  //     return Colors.blue;
  //   }
  // }
}
