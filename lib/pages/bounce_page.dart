import 'package:flutter/material.dart';
class BouncePage extends StatefulWidget {
  const BouncePage({Key? key}) : super(key: key);

  static const String id = "bounce_page";

  @override
  _BouncePageState createState() => _BouncePageState();
}

class _BouncePageState extends State<BouncePage> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween(
      begin: 400.0,
      end: 120.0,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.0, 1.0, curve: Curves.elasticIn))
    )..addStatusListener((AnimationStatus status) {
      if(status == AnimationStatus.completed){
        _controller.repeat(reverse: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bounce"),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (ctx, ch) => Container(
            width: 150,
            height: 200,
            margin: EdgeInsets.only(
              top: _animation.value,
            ),
            child: Image.asset("assets/images/ic_image3.jpeg"),
          ),
        ),
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
