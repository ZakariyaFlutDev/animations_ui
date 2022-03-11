import 'package:flutter/material.dart';
class ResizePulsePage extends StatefulWidget {
  const ResizePulsePage({Key? key}) : super(key: key);

  static String id = "resize_pulse_page";

  @override
  _ResizePulsePageState createState() => _ResizePulsePageState();
}

class _ResizePulsePageState extends State<ResizePulsePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 10000));
    _animation = Tween<double>(
      begin: 20.0,
      end: 400.0,
    ).animate(
        CurvedAnimation(parent: _controller, curve: Curves.bounceIn)
    );
    _controller.addStatusListener((AnimationStatus status) {
      if(status == AnimationStatus.completed){
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
        title: Text("Resize Pulse"),
      ),
      body: Center(
          child: AnimatedBuilder(
            builder: (ctx, ch) => Container(
              width: _animation.value,
              height: _animation.value,
              child: Image.asset("assets/images/image1.jpeg", fit: BoxFit.cover,),
            ),
            animation: _animation,
          )
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: (){
          _controller.forward();
        },
      ),

    );
  }
}
