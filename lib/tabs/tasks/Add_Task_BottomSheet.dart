import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Models/quiz_Model.dart';
import 'package:provider/provider.dart';
import '../../Shared/firebase/FireBase_Functions.dart';
import '../../Shared/styles/Colors.dart';
import '../../providers/my_provider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var questionController = TextEditingController();
  var answerController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return Container(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 18.w),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add New Question",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    color: Theme.of(context).indicatorColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Question";
                  }
                  return null;
                },
                style: GoogleFonts.inter(
                    color: pro.themeMode == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
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
                  hintText: "Enter Question",
                  hintStyle: GoogleFonts.inter(
                      color: const Color(0xffA9A9A9).withOpacity(.61),
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter Answer";
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
                  hintText: "Enter Answer",
                  hintStyle: GoogleFonts.inter(
                      color: const Color(0xffA9A9A9).withOpacity(.61),
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      QuestionModel questionModel = QuestionModel(
                          question: questionController.text,
                          answer: answerController.text);
                      FirebaseFunctions.addQuestion(questionModel);
                      Navigator.pop(context, (route) => false);
                    }
                  },
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)))),
                  child: Text(
                    "Add Question",
                    style: TextStyle(fontSize: 16.sp),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
