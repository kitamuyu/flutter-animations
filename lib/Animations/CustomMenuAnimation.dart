import 'package:flutter/material.dart';

class CustomMenuPage extends StatefulWidget {
  static const routeName = 'custommenu';

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<CustomMenuPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
