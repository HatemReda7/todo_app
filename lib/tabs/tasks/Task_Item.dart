import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Shared/styles/Colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            children: [
              Container(
                height: 62,
                width: 4,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.taskTitle,style: GoogleFonts.poppins(color: primary,fontSize: 18,fontWeight: FontWeight.w700),),
                  Text(AppLocalizations.of(context)!.taskDescription,style: GoogleFonts.poppins(color: primary,fontSize: 14,fontWeight: FontWeight.w400),),
                ],
              ),
              Spacer(),
              ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    iconSize: MaterialStatePropertyAll(40),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  child: Icon(Icons.done,))
            ],
          ),
        ),
      ),
    );
  }
}
