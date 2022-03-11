import 'package:flutter/material.dart';

class Flip3DPage extends StatefulWidget {
  const Flip3DPage({Key? key}) : super(key: key);

  static const String id = "flip_3d_page";

  @override
  _Flip3DPageState createState() => _Flip3DPageState();
}

class _Flip3DPageState extends State<Flip3DPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  AnimationStatus _status = AnimationStatus.dismissed;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        _status = status;
      });
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
        title: const Text("3D Flip"),
      ),
      body: Center(
        child: Transform(
          alignment: FractionalOffset.center,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.002)
            ..rotateX(3.14 * (_animation.value)),
          child: Container(
            color: Colors.blue,
            width: 200,
            height: 200,
            child: const Icon(
              Icons.star_border,
              color: Colors.white,
              size: 50,
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
