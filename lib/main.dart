import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_perference/homepage.dart';
import 'package:shared_perference/provider_tutorial/homescreen.dart';
import 'package:shared_perference/provider_tutorial/provider/auth_provider.dart';
import 'package:shared_perference/provider_tutorial/provider/count_provider.dart';
import 'package:shared_perference/provider_tutorial/provider/example_one_provider.dart';
import 'package:shared_perference/provider_tutorial/provider/favourite_provider.dart';
import 'package:shared_perference/provider_tutorial/provider/theme_changes.dart';
import 'package:shared_perference/provider_tutorial/screens/count_example.dart';
import 'package:shared_perference/provider_tutorial/screens/dart_theme_screen.dart';
import 'package:shared_perference/provider_tutorial/screens/example_one_screen.dart';
import 'package:shared_perference/provider_tutorial/screens/favourite/favourite_screen.dart';
import 'package:shared_perference/provider_tutorial/screens/login.dart';
import 'package:shared_perference/provider_tutorial/screens/value_notify_lister.dart';
import 'package:shared_perference/provider_tutorial/stateful_widget_screen.dart';
import 'package:shared_perference/provider_tutorial/why_provider.dart';
import 'package:shared_perference/splash_screen.dart';
import 'package:shared_perference/tts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => FavouriteItemProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChanger()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: Builder(builder: (BuildContext context){
          final themeChanger=Provider.of<ThemeChanger>(context);


          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(brightness: Brightness.light,primaryColor: Colors.purple,
              primarySwatch: Colors.cyan,
              appBarTheme: AppBarTheme(backgroundColor: Colors.teal),iconTheme: IconThemeData(
                color: Colors.brown
              ),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),darkTheme: ThemeData(brightness: Brightness.dark),
            home: ExampleOneScreen (),
            debugShowCheckedModeBanner: false,
          );
        }));
  }
}
