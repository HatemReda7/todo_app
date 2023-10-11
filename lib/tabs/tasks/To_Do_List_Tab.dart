import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Shared/styles/Colors.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/tabs/tasks/Task_Item.dart';
import 'package:provider/provider.dart';

class ToDOListTab extends StatelessWidget {
  static const String routeName="To DO List Tab";

  const ToDOListTab({super.key});

  @override
  Widget build(BuildContext context) {
    var pro= Provider.of<MyProvider>(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 35,horizontal: 25),
          height: 100,
          width: double.infinity,
          color: primary,
          child: Text("To Do",style: GoogleFonts.poppins(color: Theme.of(context).shadowColor,fontSize: 22,fontWeight: FontWeight.w700,),),
        ),
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: Theme.of(context).indicatorColor,
          dayColor: Theme.of(context).indicatorColor,
          activeDayColor: primary,
          activeBackgroundDayColor: Theme.of(context).indicatorColor,
          dotsColor: primary,
          selectableDayPredicate: (date) => true,
          locale: pro.languageCode,
        ),
        Expanded(
          child: ListView.builder(itemBuilder: (context, index) {
            return const TaskItem();
          },itemCount: 8,),
        )
      ],
    );
  }
}
