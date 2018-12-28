import 'package:flutter/material.dart';
import '../widgets/cat.dart';
import 'dart:math';

class Home extends StatefulWidget {
  State createState () {
    return HomeState();
  }
}

class HomeState extends State<Home> with TickerProviderStateMixin {

  // Animation records the current value of the prop being animated and the status of the animation.
  Animation<double> catAnimation;
  // AnimationController starts, stops and restarts the animation.
  AnimationController catController;

  initState () {
    super.initState();

    catController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this
    );

    // Tween describes de range that the value being animatied spans.
    catAnimation = Tween(begin: -35.0, end: -80.0)
      .animate(
        CurvedAnimation(
          parent: catController,
          curve: Curves.easeIn
        )
      );
  }

  void onTap () {
    if (catController.status == AnimationStatus.completed) {
      catController.reverse();
    }else if (catController.status == AnimationStatus.dismissed){
      catController.forward();
    }
  }

  Widget build (context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation!')
      ),
      body: GestureDetector(
        child: Center(
          child: Stack(
            overflow: Overflow.visible,
            children: [
              buildCatAnimation(),
              buildBox(),
              buildLeftFlap(),
             ]
          )
        ),
        onTap: onTap,
      )
    );
  }

  Widget buildCatAnimation() {
    // AnimatedBuilder takes an animation and a builder function. Every time the animation ticks (changes value), builder runs again.
    return AnimatedBuilder(
      animation: catAnimation,
      builder: (context, child) {
        // Positioned class will have an absolute position.
        return Positioned(
          child: child,
          top: catAnimation.value,
          right: 0.0,
          left: 0.0
        );
      },
      // child will be sent to builder function in order to avoid recreating a lot of instances of the same object in order to animate (Cat).
      child: Cat()
    );
  }

  Widget buildBox () {
    return Container(
      width: 200,
      height: 200,
      color: Colors.brown
    );
  }

  Widget buildLeftFlap () {
    return Positioned(
      left: 3.0,
      child: Transform.rotate(
        angle: pi * 0.6,
        alignment: Alignment.topLeft,
        child: Container(
          height: 12.0,
          width: 100.0,
          color: Colors.brown
        )
      )
    );
  }

}