import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Shared/styles/Colors.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatefulWidget {
  static const String routeName= "Settings Tab";

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
          padding: EdgeInsets.only(top: 30),
          width: 413,
          height: 157,
          decoration: BoxDecoration(
            color: Color(0xff5D9CEC)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 40),
            child: Text(AppLocalizations.of(context)!.settings,style: GoogleFonts.poppins(color: Theme.of(context).shadowColor,fontSize: 22,fontWeight: FontWeight.w700,),),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20,),
              Text(AppLocalizations.of(context)!.language,style: GoogleFonts.poppins(color: Theme.of(context).indicatorColor,fontSize: 14,fontWeight: FontWeight.w700,)),
              SizedBox(height: 10,),
              InkWell(
                onTap: () {
                  showModalBottomSheet(context: context, builder: (context) {
                    return Container(
                      color: Theme.of(context).cardColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                            child: InkWell(
                              onTap: () {
                                pro.changeLanguage("en");
                                setState(() {

                                });
                              },
                              child: Row(
                                children: [
                                  Text("English",style: GoogleFonts.poppins(color: pro.languageCode=="en"? primary:Theme.of(context).indicatorColor,fontSize: 20,fontWeight: FontWeight.w700,)),
                                  Spacer(),
                                  pro.languageCode=="en"? Icon(Icons.done,color: primary):SizedBox.shrink(),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                            child: InkWell(
                              onTap: () {
                                pro.changeLanguage("ar");
                                setState(() {

                                });
                              },
                              child: Row(
                                children: [
                                  Text("عربي",style: GoogleFonts.poppins(color: pro.languageCode=="ar"? primary:Theme.of(context).indicatorColor,fontSize: 20,fontWeight: FontWeight.w700,)),
                                  Spacer(),
                                  pro.languageCode=="ar"? Icon(Icons.done,color: primary):SizedBox.shrink(),
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
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: 319,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                      border: Border.all(color: Color(0xff5D9CEC),width: 2)
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(pro.languageCode=="en"?"English":"عربي",style: GoogleFonts.inter(color: Color(0xff5D9CEC),fontSize: 16,fontWeight: FontWeight.w400,)),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(Icons.arrow_drop_down,color: Color(0xff5D9CEC),),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text(AppLocalizations.of(context)!.theme,style: GoogleFonts.poppins(color: Theme.of(context).indicatorColor,fontSize: 14,fontWeight: FontWeight.w700,)),
              SizedBox(height: 10,),
              InkWell(
                onTap: () {
                  showModalBottomSheet(context: context, builder: (context) {
                    return Container(
                      color: Theme.of(context).cardColor,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                            child: InkWell(
                              onTap: () {
                                pro.changeTheme(ThemeMode.light);
                                setState(() {

                                });
                              },
                              child: Row(
                                children: [
                                  Text("Light",style: GoogleFonts.poppins(color: pro.themeMode==ThemeMode.light? primary:Theme.of(context).indicatorColor,fontSize: 20,fontWeight: FontWeight.w700,)),
                                  Spacer(),
                                  pro.themeMode==ThemeMode.light? Icon(Icons.done,color: primary):SizedBox.shrink(),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 20),
                            child: InkWell(
                              onTap: () {
                                pro.changeTheme(ThemeMode.dark);
                                setState(() {

                                });
                              },
                              child: Row(
                                children: [
                                  Text("Dark",style: GoogleFonts.poppins(color: pro.themeMode==ThemeMode.dark? primary:Theme.of(context).indicatorColor,fontSize: 20,fontWeight: FontWeight.w700,)),
                                  Spacer(),
                                  pro.themeMode==ThemeMode.dark? Icon(Icons.done,color: primary):SizedBox.shrink(),
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
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: 319,
                  height: 48,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Color(0xff5D9CEC),width: 2)
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(pro.themeMode==ThemeMode.light?"Light":"Dark",style: GoogleFonts.inter(color: Color(0xff5D9CEC),fontSize: 16,fontWeight: FontWeight.w400,)),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(Icons.arrow_drop_down,color: Color(0xff5D9CEC),),
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
