import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';
import 'homescreen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'Splash';

  const SplashScreen({super.key});

  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    Timer(
        const Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen())));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Image.asset(
          pro.themeMode == ThemeMode.light
              ? "assets/images/splash.png"
              : "assets/images/splash_dark.png",
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}