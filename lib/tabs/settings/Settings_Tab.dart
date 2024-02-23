import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../Shared/styles/colors.dart';
import '../../providers/my_provider.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName= "Settings Tab";

  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var pro= Provider.of<MyProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 50.h,horizontal: 40.w),
          width: 413.w,
          height: 157.h,
          decoration: const BoxDecoration(
              color: Color(0xff5D9CEC)
          ),
          child: Text(AppLocalizations.of(context)!.settings,style: GoogleFonts.poppins(color: Theme.of(context).shadowColor,fontSize: 22.sp,fontWeight: FontWeight.w700,),),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.h,),
              Text(AppLocalizations.of(context)!.language,style: GoogleFonts.poppins(color: Theme.of(context).indicatorColor,fontSize: 14.sp,fontWeight: FontWeight.w700,)),
              SizedBox(height: 10.h,),
              InkWell(
                onTap: () {
                  showModalBottomSheet(context: context, builder: (context) {
                    return Container(
                      color: Theme.of(context).cardColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 20.w),
                            child: InkWell(
                              onTap: () {
                                pro.changeLanguage("en");
                                setState(() {

                                });
                              },
                              child: Row(
                                children: [
                                  Text("English",style: GoogleFonts.poppins(color: pro.languageCode=="en"? primary:Theme.of(context).indicatorColor,fontSize: 20.sp,fontWeight: FontWeight.w700,)),
                                  const Spacer(),
                                  pro.languageCode=="en"? const Icon(Icons.done,color: primary):const SizedBox.shrink(),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h,),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 20.w),
                            child: InkWell(
                              onTap: () {
                                pro.changeLanguage("ar");
                                setState(() {

                                });
                              },
                              child: Row(
                                children: [
                                  Text("عربي",style: GoogleFonts.poppins(color: pro.languageCode=="ar"? primary:Theme.of(context).indicatorColor,fontSize: 20.sp,fontWeight: FontWeight.w700,)),
                                  const Spacer(),
                                  pro.languageCode=="ar"? const Icon(Icons.done,color: primary):const SizedBox.shrink(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  width: 319.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xff5D9CEC),width: 2.w)
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(pro.languageCode=="en"?"English":"عربي",style: GoogleFonts.inter(color: const Color(0xff5D9CEC),fontSize: 16.sp,fontWeight: FontWeight.w400,)),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: const Icon(Icons.arrow_drop_down,color: Color(0xff5D9CEC),),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              Text(AppLocalizations.of(context)!.theme,style: GoogleFonts.poppins(color: Theme.of(context).indicatorColor,fontSize: 14.sp,fontWeight: FontWeight.w700,)),
              SizedBox(height: 10.h,),
              InkWell(
                onTap: () {
                  showModalBottomSheet(context: context, builder: (context) {
                    return Container(
                      color: Theme.of(context).cardColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 20.w),
                            child: InkWell(
                              onTap: () {
                                pro.changeTheme(ThemeMode.light);
                                setState(() {

                                });
                              },
                              child: Row(
                                children: [
                                  Text("Light",style: GoogleFonts.poppins(color: pro.themeMode==ThemeMode.light? primary:Theme.of(context).indicatorColor,fontSize: 20.sp,fontWeight: FontWeight.w700,)),
                                  const Spacer(),
                                  pro.themeMode==ThemeMode.light? const Icon(Icons.done,color: primary):const SizedBox.shrink(),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h,),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h,horizontal: 20.w),
                            child: InkWell(
                              onTap: () {
                                pro.changeTheme(ThemeMode.dark);
                                setState(() {

                                });
                              },
                              child: Row(
                                children: [
                                  Text("Dark",style: GoogleFonts.poppins(color: pro.themeMode==ThemeMode.dark? primary:Theme.of(context).indicatorColor,fontSize: 20.sp,fontWeight: FontWeight.w700,)),
                                  const Spacer(),
                                  pro.themeMode==ThemeMode.dark? const Icon(Icons.done,color: primary):const SizedBox.shrink(),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  width: 319.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xff5D9CEC),width: 2.w)
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text(pro.themeMode==ThemeMode.light?"Light":"Dark",style: GoogleFonts.inter(color: const Color(0xff5D9CEC),fontSize: 16.sp,fontWeight: FontWeight.w400,)),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: const Icon(Icons.arrow_drop_down,color: Color(0xff5D9CEC),),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )

      ],
    );
  }
}