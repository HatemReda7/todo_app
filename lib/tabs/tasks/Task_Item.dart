import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Shared/firebase/FireBase_Functions.dart';
import 'package:islami_app/Shared/styles/Colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:islami_app/tabs/tasks/TaskEditTab.dart';
import '../../Models/Task_Model.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;
  TaskItem({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 8.h),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        child: Slidable(
          startActionPane: ActionPane(motion: const ScrollMotion(), children: [
            SlidableAction(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
              onPressed: (context) {
                FirebaseFunctions.deleteTask(task.id);
              },
              backgroundColor: Color(0xffEC4B4B),
              icon: Icons.delete,
              label: "Delete",
            ),
            SlidableAction(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
              onPressed: (context) {
                Navigator.pushNamed(context, TaskEdit.routeName,
                arguments: TaskModel(title: task.title,description: task.description,date: task.date,id: task.id,isDone: task.isDone));
              },
              backgroundColor: Colors.blue,
              icon: Icons.edit,
              label: "Edit",
            ),
          ]),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 18.w),
            child: Row(
              children: [
                Container(
                  height: 62.h,
                  width: 4.w,
                  decoration: BoxDecoration( color: task.isDone==false?primary:Color(0xff61E757), borderRadius: BorderRadius.circular(18),
                  ),
                ),
                SizedBox(width: 20.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${task.title}",
                      style: GoogleFonts.poppins(
                          color: task.isDone==false?primary:Color(0xff61E757),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "${task.description}",
                      style: GoogleFonts.poppins(
                          color: task.isDone==false?primary:Color(0xff61E757),
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
                   child: Text("Done!",style: TextStyle(color: Color(0xff61E757),fontSize: 22,fontWeight: FontWeight.w700),))
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
                     borderRadius: BorderRadius.circular(10),
                       color: Color(0xff5D9CEC)
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
}
