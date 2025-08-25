import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: Column(
                spacing: 25,
                children: [
                  CircleAvatar(
                    radius: 150,
                      backgroundImage: AssetImage("assets/images/hello.png")),
                  Text("All news in one place, \nbe the first to know last news",textAlign: TextAlign.center,style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
            MaterialButton(
              minWidth: double.maxFinite,
              height: 56,
              color: Color(0xff004469),
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color:Color(0xff004469))),
              onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
              },
              child: Text("Get Started",style: TextStyle(fontSize: 20,color: Colors.white),),)
          ],
        ),
      ),
    );
  }
}
