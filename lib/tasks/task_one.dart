import 'package:flutter/material.dart';

class TaskOne extends StatefulWidget {
  const TaskOne({Key? key}) : super(key: key);

  static const String id = "task_one";

  @override
  _TaskOneState createState() => _TaskOneState();
}

class _TaskOneState extends State<TaskOne> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animation = Tween(begin: 400.0, end: 120.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.elasticIn),
      ),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          _controller.repeat(reverse: true);
        }
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task One"),
      ),
      body: AnimatedBuilder(
        animation: _animation,
        builder: (ctx, ch) => Container(
          width: 100,
          height: 100,
          child: Image.asset("assets/images/img.png"),
          margin: EdgeInsets.only(top: _animation.value, left: 100),
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
