import 'package:animations_ui/pages/bounce_page.dart';
import 'package:animations_ui/pages/fade_in_out_page.dart';
import 'package:animations_ui/pages/flip_3d.dart';
import 'package:animations_ui/pages/hinge_page.dart';
import 'package:animations_ui/pages/home_page.dart';
import 'package:animations_ui/pages/resize_pulse_page.dart';
import 'package:animations_ui/pages/slide_page.dart';
import 'package:animations_ui/tasks/task_one.dart';
import 'package:animations_ui/tasks/task_two.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        FadeInOutPage.id:(context) => FadeInOutPage(),
        ResizePulsePage.id:(context) => ResizePulsePage(),
        SlidePage.id:(context) => SlidePage(),
        BouncePage.id:(context) => BouncePage(),
        Flip3DPage.id:(context) => Flip3DPage(),
        HingePage.id:(context) => HingePage(),
        TaskOne.id:(context) => TaskOne(),
        TaskTwo.id:(context) => TaskTwo(),
      },
    );
  }
}
