import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Models/quiz_Model.dart';
import '../../Shared/firebase/FireBase_Functions.dart';
import '../../providers/my_provider.dart';
import 'TaskEditTab.dart';

class TaskItem extends StatelessWidget {
  final QuestionModel question;
  const TaskItem({required this.question, super.key});

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
            SlidableAction(
              borderRadius: pro.languageCode=="ar"?BorderRadius.only(topLeft: Radius.circular(15.r), bottomLeft: Radius.circular(15.r))
                  :BorderRadius.only(topRight: Radius.circular(15.r), bottomRight: Radius.circular(15.r)),
              onPressed: (context) {
                Navigator.pushNamed(context, TaskEdit.routeName,
                    arguments: QuestionModel(question: question.question, answer: question.answer));
              },
              backgroundColor: Colors.blue,
              icon: Icons.edit,
              label: AppLocalizations.of(context)!.edit,
            ),
          ]),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
            child: Row(
              children: [
                Container(
                  height: 62.h,
                  width: 4.w,
                  //question.isDone==false?primary:const Color(0xff61E757)
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
                const Spacer(),
                question.isDone?InkWell(
                    onTap: () {
                      question.isDone=false;
                      FirebaseFunctions.editQuestion(question);
                    },
                    child: Text(AppLocalizations.of(context)!.done,style: TextStyle(color: const Color(0xff61E757),fontSize: 22.sp,fontWeight: FontWeight.w700),))
                    :InkWell(
                  onTap: () {
                    question.isDone=true;
                    FirebaseFunctions.editQuestion(question);
                  },
                  child: Container(
                      width: 69.w,
                      height: 34.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          // color: checkColor()
                        color: Colors.blue
                      ),
                      child: Icon(Icons.check,size: 35.sp,color: Colors.white,fill: 0.5,)),
                )
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
