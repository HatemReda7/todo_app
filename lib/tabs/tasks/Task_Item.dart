import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../Models/task_model.dart';
import '../../Shared/FireBase/firebase_functions.dart';
import '../../providers/my_provider.dart';
import 'TaskEditTab.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;
  TaskItem({required this.task, super.key});

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
                FirebaseFunctions.deleteTask(task.id);
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
                    arguments: TaskModel(title: task.title,description: task.description,date: task.date,id: task.id,isDone: task.isDone));
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
                  //task.isDone==false?primary:const Color(0xff61E757)
                  decoration: BoxDecoration( color: checkColor(),
                    borderRadius: BorderRadius.circular(18.r),
                  ),
                ),
                SizedBox(width: 20.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: GoogleFonts.poppins(
                          color: checkColor(),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      task.description,
                      style: GoogleFonts.poppins(
                          color: checkColor(),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const Spacer(),
                task.isDone?InkWell(
                    onTap: () {
                      task.isDone=false;
                      FirebaseFunctions.editTask(task);
                    },
                    child: Text(AppLocalizations.of(context)!.done,style: TextStyle(color: const Color(0xff61E757),fontSize: 22.sp,fontWeight: FontWeight.w700),))
                    :InkWell(
                  onTap: () {
                    task.isDone=true;
                    FirebaseFunctions.editTask(task);
                  },
                  child: Container(
                      width: 69.w,
                      height: 34.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: checkColor()
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
  //task.date<=DateTime.now().millisecondsSinceEpoch?Colors.red:Colors.blue;
  Color checkColor(){
    if(task.isDone){
      return const Color(0xff61E757);
    }else if(task.date<=DateTime.now().subtract(const Duration(days: 1)).millisecondsSinceEpoch){
      return Colors.red;
    }else{
      return Colors.blue;
    }
  }
}