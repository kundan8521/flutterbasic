import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RippleAnimationDemo extends StatefulWidget {
  const RippleAnimationDemo({super.key});

  @override
  State<RippleAnimationDemo> createState() => _RippleAnimationDemoState();
}

class _RippleAnimationDemoState extends State<RippleAnimationDemo>with SingleTickerProviderStateMixin {

  late Animation _animation;
  late AnimationController _animationController;
  var listRadius = [150.0,200.0,250.0,300.0,350.0];
  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 4),lowerBound: 0.5 );
    _animation = Tween(begin: 0.0,end: 1.0).animate(_animationController);
    _animationController.addListener( () {
      setState(() {

      });

    },);
    _animationController.forward();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ripple Animation'),
        backgroundColor: Colors.teal,

      ),
      body: Center(
         child: Stack(
           alignment: Alignment.center,
           children: listRadius.map((radius) => Container(
             height: radius*_animation.value,
             width: radius*_animation.value,
             decoration: BoxDecoration(

               shape: BoxShape.circle,
                   color: Colors.blue.withOpacity(1.0-_animation.value)
             ),
           ),).toList()
         ),
      ),
    );
  }
}
