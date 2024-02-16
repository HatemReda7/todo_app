import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Models/quiz_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Shared/firebase/FireBase_Functions.dart';
import '../../Shared/styles/colors.dart';
import '../../providers/my_provider.dart';

class QuestionEdit extends StatefulWidget {
  static const String routeName="Question edit";

  const QuestionEdit({super.key});

  @override
  State<QuestionEdit> createState() => _QuestionEditState();
}

class _QuestionEditState extends State<QuestionEdit> {
  var questionController = TextEditingController();
  var answerController = TextEditingController();

  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as QuestionModel;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(size: 30.sp,color: pro.themeMode==ThemeMode.light?Colors.white:Colors.black),
        toolbarHeight: 100.h,
        title: Text("FlashCard Quiz",style: GoogleFonts.poppins(color: Theme.of(context).shadowColor,fontSize: 22.sp,fontWeight: FontWeight.w700,),),
      ),
      body: SizedBox(
        height: 688.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
          child: Card(
              color: pro.themeMode==ThemeMode.light?Colors.white:darkGreyColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.r)),
              elevation: 20.sh,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 12.w),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Edit Question",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: Theme.of(context).indicatorColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 18.sp),
                        ),
                        SizedBox(height: 20.h,),
                        TextFormField(
                          validator: (value) {
                            if(value== null || value.isEmpty){
                              return "Please enter Question";
                            }
                            return null;
                          },
                          style: GoogleFonts.inter(
                              color: pro.themeMode==ThemeMode.light? Colors.black : Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp),
                          controller: questionController,
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
                            hintText: args.question,
                            hintStyle: GoogleFonts.inter(
                                color: const Color(0xffA9A9A9).withOpacity(.61),
                                fontWeight: FontWeight.w400,
                                fontSize: 20.sp),
                          ),
                        ),
                        SizedBox(height: 20.h,),
                        TextFormField(
                          validator: (value) {
                            if(value== null || value.isEmpty){
                              return "Please enter Answer";
                            }
                            return null;
                          },
                          style: GoogleFonts.inter(
                              color: pro.themeMode==ThemeMode.light? Colors.black : Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16.sp),
                          controller: answerController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: const BorderSide(color: primary),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12).r,
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.r),
                              borderSide: const BorderSide(color: primary),
                            ),
                            hintText: args.answer,
                            hintStyle: GoogleFonts.inter(
                                color: const Color(0xffA9A9A9).withOpacity(.61),
                                fontWeight: FontWeight.w400,
                                fontSize: 20.sp),
                          ),
                        ),
                        SizedBox(height: 70.h,),
                        InkWell(
                          onTap: () {
                            if(formKey.currentState!.validate()){
                              args.question=questionController.text;
                              args.answer=answerController.text;
                              FirebaseFunctions.editQuestion(args);
                              Navigator.pop(context);
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
                            width: 240.w,
                            height: 45.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.r),
                                color: primary
                            ),
                            child: Text(AppLocalizations.of(context)!.saveChanges,style: GoogleFonts.inter(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w400),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }
}
