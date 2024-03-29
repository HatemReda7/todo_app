import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../Models/task_model.dart';
import '../../Shared/FireBase/firebase_functions.dart';
import '../../Shared/styles/Colors.dart';
import '../../providers/my_provider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  var selectedDate = DateTime.now();
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
                AppLocalizations.of(context)!.addNewTask,
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
                    return "Please enter Task Title";
                  }
                  return null;
                },
                style: GoogleFonts.inter(
                    color: pro.themeMode == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp),
                controller: titleController,
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
                  hintText: AppLocalizations.of(context)!.enterTaskTitle,
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
                    return "Please enter Task Description";
                  }
                  return null;
                },
                style: GoogleFonts.inter(
                    color: pro.themeMode == ThemeMode.light
                        ? Colors.black
                        : Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp),
                controller: descriptionController,
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
                  hintText: AppLocalizations.of(context)!.enterTaskDescription,
                  hintStyle: GoogleFonts.inter(
                      color: const Color(0xffA9A9A9).withOpacity(.61),
                      fontWeight: FontWeight.w400,
                      fontSize: 20.sp),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                AppLocalizations.of(context)!.selectTime,
                style: GoogleFonts.inter(
                    color: Theme.of(context).indicatorColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  selectDate();
                },
                child: Text(
                  selectedDate.toString().substring(0, 10),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      color: Theme.of(context).indicatorColor.withOpacity(.61),
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
                      TaskModel taskModel = TaskModel(
                          title: titleController.text,
                          description: descriptionController.text,
                          date: DateUtils.dateOnly(selectedDate)
                              .millisecondsSinceEpoch);
                      FirebaseFunctions.addTask(taskModel);
                      Navigator.pop(context, (route) => false);
                    }
                  },
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r)))),
                  child: Text(
                    AppLocalizations.of(context)!.addTask,
                    style: TextStyle(fontSize: 16.sp),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void selectDate() async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));

    if (chosenDate == null) {
      return;
    } else {
      selectedDate = chosenDate;
    }
    setState(() {});
  }
}