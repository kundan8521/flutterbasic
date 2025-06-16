import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbasic/animations/detailed_page.dart';

class HeroAnimationDemo extends StatefulWidget {
  const HeroAnimationDemo({super.key});

  @override
  State<HeroAnimationDemo> createState() => _HeroAnimationDemoState();
}

class _HeroAnimationDemoState extends State<HeroAnimationDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Hero  Animation'),
      ),
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          child: Center(
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => DetailedPage(), ));
              },
                child: Hero(tag:'background' , child:Image.asset('assets/images/login_screen.jpeg') )),
          ),
        ),
      ),


    );
  }
}
