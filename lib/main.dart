import 'package:flutter/material.dart';
import 'package:lost_and_found/dashboard.dart';
import 'package:lost_and_found/loginPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Color(0xFF57606F)),
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Color(0xFF57606F) ),
        fontFamily: 'Raleway',
      ),
      home: LoginPage(),
    routes: <String, WidgetBuilder> {
    '/dashboard': (BuildContext context) => new DashBoard(),},
    );
  }
}



