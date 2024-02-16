import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/tabs/tasks/quiz_tab.dart';
import '../../Models/quiz_model.dart';
import '../../Shared/firebase/FireBase_Functions.dart';
import '../../Shared/styles/colors.dart';
import 'question_item.dart';

class ToDOListTab extends StatefulWidget {
  static const String routeName="To DO List Tab";

  const ToDOListTab({super.key});

  @override
  State<ToDOListTab> createState() => _ToDOListTabState();
}

class _ToDOListTabState extends State<ToDOListTab> {

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 35.h, horizontal: 25.w),
          height: 160.h,
          width: double.infinity,
          color: primary,
          child: Column(
            children: [
              Text("Flash Card Quiz", style: GoogleFonts.poppins(color: Theme
                  .of(context)
                  .shadowColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,),),
              ElevatedButton(onPressed: () {
              // showSheet();
                Navigator.pushNamed(context, QuizTab.routeName);
              }, child:  const Text("Take Quiz!"))
            ],
          ),
        ),
        StreamBuilder(stream: FirebaseFunctions.getQuestion(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(child: Text("Something went wrong",
                style: TextStyle(color: Colors.white),));
            }
            List<QuestionModel> tasks = snapshot.data?.docs.map((e) => e.data())
                .toList() ?? [];
            return Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return TaskItem(question: tasks[index],);
              }, itemCount: tasks.length,),
            );
          },
        )
      ],
    );
  }
  void showSheet(){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context, builder: (context) {
      return Padding(
        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,),
        child: const QuizTab(),
      );
    },);
  }
}
