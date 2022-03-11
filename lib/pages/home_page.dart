import 'package:animations_ui/pages/bounce_page.dart';
import 'package:animations_ui/pages/fade_in_out_page.dart';
import 'package:animations_ui/pages/flip_3d.dart';
import 'package:animations_ui/pages/hinge_page.dart';
import 'package:animations_ui/pages/resize_pulse_page.dart';
import 'package:animations_ui/pages/slide_page.dart';
import 'package:animations_ui/tasks/task_one.dart';
import 'package:animations_ui/tasks/task_two.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, FadeInOutPage.id);
                },
                child: Text("Basic Layout  -  Fade In/ Out")
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, ResizePulsePage.id);
                },
                child: Text("Resize Pulse ")
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, SlidePage.id);
                },
                child: Text("Slide Animation ")
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, BouncePage.id);
                },
                child: Text("Bounce Animation ")
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Flip3DPage.id);
                },
                child: Text("3D Flip Animation ")
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, HingePage.id);
                },
                child: Text("Hinge Animation ")
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, TaskOne.id);
                },
                child: Text("TASK 1")
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, TaskTwo.id);
                },
                child: Text("TASK 2")
            ),
          ],
        ),
      ),
    );
  }
}
