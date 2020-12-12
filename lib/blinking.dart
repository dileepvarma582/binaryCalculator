import 'package:flutter/material.dart';
class BlinkingTextAnimation extends StatefulWidget {
  @override
  _BlinkingAnimationState createState() => _BlinkingAnimationState();
}

class _BlinkingAnimationState extends State<BlinkingTextAnimation>
    with SingleTickerProviderStateMixin {
  Animation<Color> animation;
  AnimationController controller;

  initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);

    final CurvedAnimation curve =
    CurvedAnimation(parent: controller, curve: Curves.ease);

    animation =
        ColorTween(begin: Colors.white, end: Colors.black).animate(curve);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return new Container(
            child: Text('Please Enter Values in base 10',
                style: TextStyle(color: animation.value, fontSize: 16)),
          );
        });
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}