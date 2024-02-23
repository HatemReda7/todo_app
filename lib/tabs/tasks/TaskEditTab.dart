import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Models/task_model.dart';
import '../../Shared/FireBase/firebase_functions.dart';
import '../../Shared/styles/Colors.dart';
import '../../providers/my_provider.dart';

class TaskEdit extends StatefulWidget {
  static const String routeName="task edit";

  const TaskEdit({super.key});

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
        iconTheme: IconThemeData(size: 30.sp,color: pro.themeMode==ThemeMode.light?Colors.white:Colors.black),
        toolbarHeight: 100.h,
        title: Text("To Do",style: GoogleFonts.poppins(color: Theme.of(context).shadowColor,fontSize: 22.sp,fontWeight: FontWeight.w700,),),
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
                          AppLocalizations.of(context)!.editTask,
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
                          onTap: () async{
                            DateTime? chosenDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.fromMillisecondsSinceEpoch(args.date),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now().add(const Duration(days: 365)));
                            if(chosenDate==null){
                              return;
                            }else{
                              args.date=chosenDate.millisecondsSinceEpoch;
                            }
                            setState(() {

                            });
                          },
                          child: Text(
                            DateTime.fromMillisecondsSinceEpoch(args.date).toString().substring(0,10),
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
                              FirebaseFunctions.editTask(args);
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