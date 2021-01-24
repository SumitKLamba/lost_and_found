import 'package:flutter/material.dart';
import 'package:lost_and_found/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lost_and_found/loginPage.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Color(0xFF2D3E50),
        appBarTheme: AppBarTheme(color: Color(0xFF57606F)),
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: Color(0xFF57606F)),
        fontFamily: 'Raleway',
      ),
      home: await getLandingPage(),
      routes: <String, WidgetBuilder>{
        '/dashboard': (BuildContext context) => new DashBoard(),
      },
    ),
  );
}

Future<Widget> getLandingPage() async {
  return StreamBuilder<FirebaseUser>(
    stream: _auth.onAuthStateChanged,
    builder: (BuildContext context, snapshot) {
      if (snapshot.hasData && (!snapshot.data.isAnonymous)) {
        return DashBoard();
      }else{
      return LoginPage();}
    },
  );
}