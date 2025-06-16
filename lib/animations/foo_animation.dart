import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FooAnimation extends StatefulWidget {
  const FooAnimation({super.key});

  @override
  State<FooAnimation> createState() => _FooAnimationState();
}

class _FooAnimationState extends State<FooAnimation> {
  var myOpacity = 1.0;
  var isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Foo Animation')),
      body: Center(
        child: Column(
          children: [
            AnimatedOpacity(
              opacity: myOpacity,
              duration: Duration(seconds: 2),curve: Curves.bounceInOut,
              child: Container(height: 200, width: 100, color: Colors.red),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (isVisible) {
                    myOpacity = 0.0;
                    isVisible = false;
                  }
                  else
                    {
                      myOpacity = 1.0;
                      isVisible = true;
                    }
                });
              },
              child: Text('Close'),
            ),
          ],
        ),
      ),
    );
  }
}
