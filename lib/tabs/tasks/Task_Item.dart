import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Shared/styles/Colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.0.w, vertical: 8.h),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        child: Slidable(
          startActionPane: ActionPane(motion: const ScrollMotion(), children: [
            SlidableAction(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(18), bottomLeft: Radius.circular(18)),
              onPressed: (context) {},
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: "Delete",
            ),
            SlidableAction(
              borderRadius: const BorderRadius.only(topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
              onPressed: (context) {},
              backgroundColor: Colors.grey,
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
                  decoration: BoxDecoration( color: primary, borderRadius: BorderRadius.circular(18),
                  ),
                ),
                SizedBox(width: 20.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.taskTitle,
                      style: GoogleFonts.poppins(
                          color: primary,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      AppLocalizations.of(context)!.taskDescription,
                      style: GoogleFonts.poppins(
                          color: primary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        iconSize: MaterialStatePropertyAll(40.sp),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                    child: const Icon(Icons.done,)
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
