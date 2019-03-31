import 'package:flutter/material.dart';

class StatefulAnimationPage extends StatefulWidget {
  static const routeName = 'statefulanimation';

  @override
  _AnimationState createState() => _AnimationState();
}

class _AnimationState extends State<StatefulAnimationPage> {
  bool _enabled = false;
  Image gifimage = Image.asset('assets/gifs/loading.gif');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: <Widget>[
          gifimage,
          Center(
            child: Switch(
              value: _enabled,
              onChanged: (bool value) {
                setState(() {
                  _enabled = value;
                  gifimage = _enabled
                      ? Image.asset('assets/gifs/check.gif')
                      : Image.asset('assets/gifs/loading.gif');
                });
              },
            ),
          )
        ],
      )),
    );
  }
}
