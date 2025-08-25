import 'package:flutter/material.dart';
import 'package:news_app/screens/gategory_screen.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.title});
final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryScreen(title: title),));
      },
      child: Card(
        color: Color(0xff004469),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,style: TextStyle(color: Colors.white,fontSize: 14),),
        ),
      ),
    );
  }
}


