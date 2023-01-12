import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_color_generator/material_color_generator.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: generateMaterialColor(color: darkBluishColor),
         primaryColor: generateMaterialColor(color: darkBluishColor), 
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.white,
        canvasColor: creamColor,
        buttonColor: generateMaterialColor(color: darkBluishColor),
        accentColor: generateMaterialColor(color: darkBluishColor),
        // ignore: prefer_const_constructors
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          // ignore: prefer_const_constructors
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme,
        )
      );

   static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
       primarySwatch: generateMaterialColor(color: lightBluishColor),
       primaryColor: generateMaterialColor(color: lightBluishColor), 
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkCreamColor,
        buttonColor: generateMaterialColor(color: lightBluishColor),
        accentColor: Colors.white,
        // ignore: prefer_const_constructors
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          // ignore: prefer_const_constructors
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: Theme.of(context).textTheme,
        )
      );


  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = const Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}
 
