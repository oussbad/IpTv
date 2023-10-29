import 'dart:io';
import 'package:chatnode/presentation/home.dart';
import 'package:flutter/material.dart';

void main() {
  HttpOverrides.global =  MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 1,
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blue,
            textTheme: ButtonTextTheme.accent,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      ),
      home: HomePage(),
    );
  }
}
// why this
class MyHttpOverrides extends HttpOverrides {

}
