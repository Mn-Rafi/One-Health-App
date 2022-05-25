import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

Map<int, Color> color = {
  50: const Color(0x0590EE90),
  100: const Color(0x5090EE90),
  200: const Color(0x6090EE90),
  300: const Color(0x7090EE90),
  400: const Color(0x7090EE90),
  500: const Color(0x8090EE90),
  600: const Color(0x8590EE90),
  700: const Color(0x9090EE90),
  800: const Color(0x9590EE90),
  900: const Color(0x9890EE90),
};

MaterialColor colorCustom = MaterialColor(0xFF90EE90, color);

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: colorCustom,
    textTheme: TextTheme(
      bodyText2: TextStyle(color: Colors.black)
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle:  GoogleFonts.ubuntu(fontSize: 15.sp, color: Colors.black, fontWeight: FontWeight.w400),
    )
  );
}


