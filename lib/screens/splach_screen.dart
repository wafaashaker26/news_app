import 'dart:async';

import 'package:flutter/material.dart';

import 'hello_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HelloScreen(),)),);

  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: Image.asset("assets/images/splash.png")),
    );
  }
}
