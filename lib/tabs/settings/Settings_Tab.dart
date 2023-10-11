import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsTab extends StatelessWidget {
  static const String routeName= "Settings Tab";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: 413,
          height: 157,
          decoration: BoxDecoration(
            color: Color(0xff5D9CEC)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
            child: Text("Setting",style: GoogleFonts.poppins(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w700,),),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20,),
              Text("Language",style: GoogleFonts.poppins(color: Color(0xff303030),fontSize: 14,fontWeight: FontWeight.w700,)),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: 319,
                height: 48,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff5D9CEC),width: 2)
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("English",style: GoogleFonts.inter(color: Color(0xff5D9CEC),fontSize: 12,fontWeight: FontWeight.w400,)),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.arrow_drop_down,color: Color(0xff5D9CEC),),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Text("Mode",style: GoogleFonts.poppins(color: Color(0xff303030),fontSize: 14,fontWeight: FontWeight.w700,)),
              SizedBox(height: 10,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                width: 319,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff5D9CEC),width: 2)
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Light",style: GoogleFonts.inter(color: Color(0xff5D9CEC),fontSize: 12,fontWeight: FontWeight.w400,)),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.arrow_drop_down,color: Color(0xff5D9CEC),),
                    )
                  ],
                ),
              ),
            ],
          ),
        )

      ],
    );
  }
}
