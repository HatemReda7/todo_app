import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_app/Shared/styles/Colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    primaryColor: primary,
    scaffoldBackgroundColor: mint,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primary,
      unselectedItemColor: Colors.grey,
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    )
  );
  static ThemeData darkTheme = ThemeData();
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
