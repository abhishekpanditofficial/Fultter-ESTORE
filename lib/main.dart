import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_project/pages/cart_page.dart';
import 'package:test_project/pages/home_page.dart';
import 'package:test_project/pages/login_page.dart';
import 'package:test_project/utils/routes.dart';
import 'package:test_project/widgets/themes.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    num days =30;

    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: {
        "/":(context) => LoginPage(),
        MyRoutes.homeRoute :(context) => HomePage(),
        MyRoutes.loginRoute :(context) => LoginPage(),
        MyRoutes.cartPage : (context) => CartPage()
      },
    );
  }
}