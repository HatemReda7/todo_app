import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Shared/styles/Colors.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Add New Task",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: Color(0xff383838),
                fontWeight: FontWeight.w700,
                fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: primary),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: primary),
              ),
              hintText: "Enter Task Title",
              hintStyle: GoogleFonts.inter(
                  color: Color(0xffA9A9A9).withOpacity(.61),
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: primary),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: primary),
              ),
              hintText: "Enter Task Description",
              hintStyle: GoogleFonts.inter(
                  color: Color(0xffA9A9A9).withOpacity(.61),
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Select time",
            style: GoogleFonts.inter(
                color: Color(0xff383838),
                fontWeight: FontWeight.w400,
                fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              selectDate();
            },
            child: Text(
              selectedDate.toString().substring(0, 10),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  color: Color(0xff383838).withOpacity(.61),
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              child: Text("Add Task"))
        ],
      ),
    );
  }

  void selectDate() async {
    DateTime? chosenDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));

    if(chosenDate==null){
      return;
    }else{
      selectedDate=chosenDate;
    }
    setState(() {

    });
  }
}