import 'package:flutter/material.dart';
class FadeInOutPage extends StatefulWidget {
  const FadeInOutPage({Key? key}) : super(key: key);

  static const String id = "fade_in_page";

  @override
  _FadeInOutPageState createState() => _FadeInOutPageState();
}

class _FadeInOutPageState extends State<FadeInOutPage> with SingleTickerProviderStateMixin{

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 5200));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
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
        title: Text("Fade IN/OUT"),
      ),
      body: FadeTransition(
        opacity: _animation,
        child: Center(
          child: Container(
            width: 300,
            height: 400,
            child: Image.asset("assets/images/image1.jpeg", fit: BoxFit.cover,),
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
