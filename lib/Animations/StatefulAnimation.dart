import 'package:flutter/material.dart';

class StatefulAnimationPage extends StatefulWidget {
  static const routeName = 'statefulanimation';

  @override
  _AnimationState createState() => _AnimationState();
}

class _AnimationState extends State<StatefulAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: <Widget>[
          Image.asset('assets/gifs/loading.gif'),
          Image.asset('assets/gifs/check.gif')
        ],
      )),
    );
  }
}
