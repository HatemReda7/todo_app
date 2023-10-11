import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/Shared/styles/Colors.dart';
import 'package:islami_app/tabs/tasks/Task_Item.dart';

class ToDOListTab extends StatelessWidget {
  static const String routeName="To DO List Tab";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 80,
              width: double.infinity,
              color: primary,
            ),
            CalendarTimeline(
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now().add(Duration(days: 365)),
              onDateSelected: (date) => print(date),
              leftMargin: 20,
              monthColor: Colors.black,
              dayColor: Colors.black,
              activeDayColor: primary,
              activeBackgroundDayColor: Colors.white,
              dotsColor: primary,
              selectableDayPredicate: (date) => true,
              locale: 'en',
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(itemBuilder: (context, index) {
            return TaskItem();
          },itemCount: 8,),
        )
      ],
    );
  }
}
