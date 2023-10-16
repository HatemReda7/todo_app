import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Models/Task_Model.dart';
import 'package:islami_app/Shared/firebase/FireBase_Functions.dart';
import 'package:islami_app/Shared/styles/Colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/tabs/tasks/To_Do_List_Tab.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    var pro= Provider.of<MyProvider>(context);
    return Container(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 18.w),
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
            SizedBox(height: 20.h,),
            TextFormField(
              style: GoogleFonts.inter(
                  color: pro.themeMode==ThemeMode.light? Colors.black : Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp),
              controller: titleController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: primary),
                ),
                hintText: AppLocalizations.of(context)!.enterTaskTitle,
                hintStyle: GoogleFonts.inter(
                    color: const Color(0xffA9A9A9).withOpacity(.61),
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp),
              ),
            ),
            SizedBox(height: 20.h,),
            TextFormField(
              style: GoogleFonts.inter(
            color: pro.themeMode==ThemeMode.light? Colors.black : Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp),
              controller: descriptionController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: primary),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: primary),
                ),
                hintText: AppLocalizations.of(context)!.enterTaskDescription,
                hintStyle: GoogleFonts.inter(
                    color: const Color(0xffA9A9A9).withOpacity(.61),
                    fontWeight: FontWeight.w400,
                    fontSize: 20.sp),
              ),
            ),
            SizedBox(height: 20.h,),
            Text(
              AppLocalizations.of(context)!.selectTime,
              style: GoogleFonts.inter(
                  color: Theme.of(context).indicatorColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp),
            ),
            SizedBox(height: 10.h,),
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
            SizedBox(height: 20.h,),
            ElevatedButton(
                onPressed: () {
                  TaskModel taskModel= TaskModel(title: titleController.text, description: descriptionController.text, date: selectedDate.millisecondsSinceEpoch);
                  FirebaseFunctions.addTask(taskModel);
                  Navigator.pop(context, (route) => false);
                },
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                child: Text(AppLocalizations.of(context)!.addTask,style: TextStyle(fontSize: 16.sp),))
          ],
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

    if(chosenDate==null){
      return;
    }else{
      selectedDate=chosenDate;
    }
    setState(() {

    });
  }
}
