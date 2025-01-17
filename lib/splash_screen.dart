import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_perference/homepage.dart';
import 'package:shared_perference/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYYLOGIN = "Login";

  @override
  void initState() {
    super.initState();

    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.blue,
          child: Center(
            child: Icon(
              Icons.account_circle,
              color: Colors.white,
              size: 50,
            ),
          ),
        ));
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool("KEYYLOGIN");
    Timer(Duration(seconds: 2), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Homepage()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    }

    );
  }
}



