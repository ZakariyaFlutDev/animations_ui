import 'package:flutter/material.dart';

class HingePage extends StatefulWidget {
  const HingePage({Key? key}) : super(key: key);

  static const String id = "hinge_page";

  @override
  _HingePageState createState() => _HingePageState();
}

class _HingePageState extends State<HingePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotateAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _rotateAnimation = Tween(end: 1.0, begin: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.bounceInOut),
      ),
    );
    _slideAnimation = Tween(begin: 100.0, end: 600.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
    _opacityAnimation = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hinge Animation"),
      ),
      body: AnimatedBuilder(
        animation: _slideAnimation,
        builder: (ctx, ch) => Container(
          width: 250,
          height: 100,
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.only(left: 75, top: _slideAnimation.value),
          child: RotationTransition(
            turns: _rotateAnimation,
            child: Center(
              child: Text(
                "PDP Online",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(0, 0, 120, _opacityAnimation.value)),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: () {
          _controller.forward();
        },
      ),
    );
  }
}
