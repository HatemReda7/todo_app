import 'package:flutter/material.dart';
import 'package:islami_app/Shared/styles/Colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      primaryColor: primary,
      cardColor: Colors.white,
      indicatorColor: Colors.black,
      shadowColor: Colors.white,
      scaffoldBackgroundColor: mint,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primary,
        unselectedItemColor: Colors.grey,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      bottomAppBarTheme: const BottomAppBarTheme(elevation: 0, color: Colors.white));
  static ThemeData darkTheme = ThemeData(
      primaryColor: darkPrimaryColor,
      cardColor: darkGreyColor,
      indicatorColor: Colors.white,
      shadowColor: Colors.black,
      scaffoldBackgroundColor: darkSecondaryColor,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primary,
        unselectedItemColor: Colors.white,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      bottomAppBarTheme: const BottomAppBarTheme(elevation: 0, color: darkGreyColor));
}

//colorScheme: ColorScheme(
//           brightness: Brightness.dark,
//           primary: darkPrimaryColor,
//           onPrimary: darkSecondaryColor,
//           secondary: darkSecondaryColor,
//           onSecondary: darkPrimaryColor,
//           error: darkWhiteColor,
//           onError: darkWhiteColor,
//           background: darkPrimaryColor,
//           onBackground: darkWhiteColor,
//           surface: darkSecondaryColor,
//           onSurface: darkPrimaryColor
//       ),
