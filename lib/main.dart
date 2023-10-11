import 'package:flutter/material.dart';
import 'package:islami_app/Screens/homescreen.dart';
import 'package:islami_app/Shared/styles/myThemeData.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/preference_helper.dart';
import 'package:islami_app/providers/my_provider.dart';
import 'package:islami_app/tabs/Settings_Tab.dart';
import 'package:islami_app/tabs/To_Do_List_Tab.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  PrefsHelper.prefs= await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider()..init(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(pro.languageCode),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        SettingsTab.routeName : (context) => SettingsTab(),
        ToDOListTab.routeName : (context) => ToDOListTab(),
      },
      themeMode: ThemeMode.light,
    );
  }
}