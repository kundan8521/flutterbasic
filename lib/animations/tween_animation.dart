import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TweenAnimationDemo extends StatefulWidget {
  const TweenAnimationDemo({super.key});

  @override
  State<TweenAnimationDemo> createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimationDemo>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late Animation colorAnimation;

  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    animation = Tween(begin: 0.0, end: 200.0).animate(animationController);
    colorAnimation = ColorTween(begin: Colors.red,end: Colors.black).animate(animationController);
    animationController.addListener(() {
      // print(animation.value);
      setState(() {});
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tween'),
        backgroundColor: Colors.teal,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: animation.value,
          width: animation.value,
          color:colorAnimation.value ,
        ),
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class TweenAnimationHome extends StatefulWidget {
//   @override
//   _TweenAnimationHomeState createState() => _TweenAnimationHomeState();
// }
//
// class _TweenAnimationHomeState extends State<TweenAnimationHome>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _controller = AnimationController(
//       duration: const Duration(seconds: 3),
//       vsync: this,
//     );
//
//     _animation = Tween<double>(
//       begin: 0,
//       end: 200,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
//
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Tween Animation')),
//       body: Center(
//         child: AnimatedBuilder(
//           animation: _animation,
//           builder: (context, child) {
//             return Container(
//               width: _animation.value,
//               height: _animation.value,
//               color: Colors.blueAccent,
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
