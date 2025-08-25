import 'package:flutter/material.dart';
import 'package:news_app/screens/hello_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins"
      ),
      home: const HelloScreen()
    );
  }
}

