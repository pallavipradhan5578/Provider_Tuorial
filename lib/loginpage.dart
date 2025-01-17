import 'package:flutter/material.dart';
import 'package:shared_perference/homepage.dart';
import 'package:shared_perference/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final TextEditingController uController = TextEditingController();
final TextEditingController passController = TextEditingController();

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Login Page',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(21),
              child: Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.white,
              ),
            ),
            TextField(
              controller: uController,
              decoration: InputDecoration(
                label: Text('Email'),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            TextField(
              controller: passController,
              decoration: InputDecoration(
                label: Text('Password'),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
              ),
            ),
            SizedBox(
              height: 11,
            ),
            ElevatedButton(
                onPressed: () async {
                  //if successful logged in
                  var sharedPrefs = await  SharedPreferences.getInstance();
                  sharedPrefs.setBool(SplashScreenState.KEYYLOGIN,true );
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Homepage()));
                },
                child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
