import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'res.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    // Home: AppBar
    headline4: GoogleFonts.catamaran(
      fontSize: 36,
      fontWeight: FontWeight.w600,
      color: AppColors.orangeColor,
    ),
    // Settings: App bar
    headline5: GoogleFonts.catamaran(
      fontSize: 25,
      fontWeight: FontWeight.w600,
    ),
    // HomeScreen
    headline6: GoogleFonts.catamaran(
      fontSize: 21,
      fontWeight: FontWeight.w500,
    ),
    // Login: greeting
    subtitle1: GoogleFonts.catamaran(
      fontSize: 17,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    // ChatRoom
    bodyText1: GoogleFonts.encodeSans(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor,
    ),
    // HomeScreen
    bodyText2: GoogleFonts.encodeSans(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    // Login button
    button: GoogleFonts.encodeSans(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
      color: AppColors.whiteColor,
    ),
    // Login: or continue, textSpan
    caption: GoogleFonts.encodeSans(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
  );

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        titleSpacing: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: AppColors.whiteColor,
      ),
      textTheme: lightTextTheme,
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(25, 20, 25, 20),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(15),
        ),
        fillColor: AppColors.whiteColor,
        filled: true,
      ),
    );
  }
}
