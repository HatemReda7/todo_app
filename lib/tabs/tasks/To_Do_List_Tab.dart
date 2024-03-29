import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Models/task_model.dart';
import '../../Shared/FireBase/firebase_functions.dart';
import '../../Shared/styles/Colors.dart';
import '../../providers/my_provider.dart';
import 'Task_Item.dart';

class ToDOListTab extends StatefulWidget {
  static const String routeName="To DO List Tab";

  const ToDOListTab({super.key});

  @override
  State<ToDOListTab> createState() => _ToDOListTabState();
}

class _ToDOListTabState extends State<ToDOListTab> {

  DateTime selectedDate=DateTime.now();

  @override
  Widget build(BuildContext context) {
    var pro= Provider.of<MyProvider>(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 35.h,horizontal: 25.w),
          height: 100.h,
          width: double.infinity,
          color: primary,
          child: Text("To Do",style: GoogleFonts.poppins(color: Theme.of(context).shadowColor,fontSize: 22.sp,fontWeight: FontWeight.w700,),),
        ),
        CalendarTimeline(
          initialDate: selectedDate,
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) {
            setState(() {
              selectedDate=date;
            });
          },
          leftMargin: 20.w,
          monthColor: pro.themeMode==ThemeMode.light?Colors.black:Colors.white,
          dayColor: pro.themeMode==ThemeMode.light?Colors.black:primary,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: primary,
          dotsColor: Colors.white,
          selectableDayPredicate: (date) => true,
          locale: pro.languageCode,
        ),
        StreamBuilder(stream: FirebaseFunctions.getTasks(selectedDate),
          builder: (context, snapshot) {
            if (snapshot.connectionState== ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }
            if(snapshot.hasError){
              return const Center(child: Text("Something went wrong",style: TextStyle(color: Colors.white),));
            }
            List<TaskModel> tasks= snapshot.data?.docs.map((e) => e.data()).toList()??[];
            return Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return TaskItem(task: tasks[index],);
              },itemCount: tasks.length,),
            );
          },
        )
      ],
    );
  }
}