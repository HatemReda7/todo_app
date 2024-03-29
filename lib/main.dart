import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/homescreen.dart';
import 'Screens/splash_screen.dart';
import 'Shared/styles/my_theme_data.dart';
import 'firebase_options.dart';
import 'preference_helper.dart';
import 'providers/my_provider.dart';
import 'tabs/settings/Settings_Tab.dart';
import 'tabs/tasks/TaskEditTab.dart';
import 'tabs/tasks/To_Do_List_Tab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.disableNetwork();
  PrefsHelper.prefs = await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(
      create: (context) =>
      MyProvider()
        ..init(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) =>
          MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(pro.languageCode),
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.routeName,
            routes: {
              SplashScreen.routeName: (context) => const SplashScreen(),
              HomeScreen.routeName: (context) => const HomeScreen(),
              SettingsTab.routeName: (context) => const SettingsTab(),
              ToDOListTab.routeName: (context) => const ToDOListTab(),
              TaskEdit.routeName: (context) => const TaskEdit(),
            },
            theme: MyThemeData.lightTheme,
            darkTheme: MyThemeData.darkTheme,
            themeMode: pro.themeMode,
          ),
    );
  }
}