import 'package:flutter/material.dart';

class TaskTwo extends StatefulWidget {
  const TaskTwo({Key? key}) : super(key: key);

  static const String id = "task_two";

  @override
  _TaskTwoState createState() => _TaskTwoState();
}

class _TaskTwoState extends State<TaskTwo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    _animation = Tween(begin: 100.0, end: 150.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn));

    _controller.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        _controller.repeat();
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
        title: Text("Task Two"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (ctx, ch) => Container(
          width: _animation.value,
            height: _animation.value,
            child: Image.asset("assets/images/img_1.png"),
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
