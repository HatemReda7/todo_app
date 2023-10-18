import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:islami_app/Models/Task_Model.dart';
import 'package:islami_app/Shared/firebase/FireBase_Functions.dart';
import 'package:islami_app/Shared/styles/Colors.dart';
import 'package:islami_app/tabs/tasks/To_Do_List_Tab.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../providers/my_provider.dart';

class TaskEdit extends StatefulWidget {
  static const String routeName="task edit";

  @override
  State<TaskEdit> createState() => _TaskEditState();
}

class _TaskEditState extends State<TaskEdit> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  var selectedDate = DateTime.now();
  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    var args = ModalRoute.of(context)?.settings.arguments as TaskModel;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(size: 30,color: pro.themeMode==ThemeMode.light?Colors.white:Colors.black),
        toolbarHeight: 100.h,
        title: Text("To Do",style: GoogleFonts.poppins(color: Theme.of(context).shadowColor,fontSize: 22.sp,fontWeight: FontWeight.w700,),),
      ),
      body: Container(
        height: 688,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Card(
            color: pro.themeMode==ThemeMode.light?Colors.white:darkGreyColor,
            margin: const EdgeInsets.only(bottom: 40),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18)),
            elevation: 20,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 12.w),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Edit Task",
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
                            return "Please enter Task Title";
                          }
                          return null;
                        },
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
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: primary),
                          ),
                          hintText: args.title,
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
                            return "Please enter Task Description";
                          }
                          return null;
                        },
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
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.red),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: primary),
                          ),
                          hintText: args.description,
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
                      SizedBox(height: 20.h,),
                      InkWell(
                        onTap: () {
                          selectDate();
                        },
                        child: Text(
                          selectedDate.toString().substring(0,10),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                              color: Theme.of(context).indicatorColor.withOpacity(.61),
                              fontWeight: FontWeight.w400,
                              fontSize: 20.sp),
                        ),
                      ),
                      SizedBox(height: 70.h,),
                      InkWell(
                        onTap: () {
                          if(formKey.currentState!.validate()){
                            args.title=titleController.text;
                            args.description=descriptionController.text;
                            args.date=DateUtils.dateOnly(selectedDate).millisecondsSinceEpoch;
                            FirebaseFunctions.editTask(args);
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.all(20),
                          width: 240.w,
                          height: 45.h,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: primary
                          ),
                          child: Text("Save Changes",style: GoogleFonts.inter(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w400),),
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
