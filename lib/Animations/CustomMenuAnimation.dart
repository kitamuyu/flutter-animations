import 'package:flutter/material.dart';
import 'dart:math';

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
    _controller.forward().orCancel;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Container(
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            Page(),
            Guillotine(),
          ],
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 90),
      color: Color(0xff222222),
    );
  }
}

class Guillotine extends StatefulWidget {
  @override
  _GuillotineState createState() => _GuillotineState();
}

class _GuillotineState extends State<Guillotine> {
  double rotationAngle = 0;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    return Transform.rotate(
      angle: rotationAngle,
      origin: Offset(24, 56),
      alignment: Alignment.topLeft,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: screenWidth,
          height: screenHeight,
          color: Color(0xFF333333),
          child: Stack(
            children: <Widget>[
              _buildMenuTitle(),
              _buildMenuIcon(),
              _buildMenuContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuTitle() {
    return Positioned(
      top: 32,
      left: 40,
      width: MediaQuery.of(context).size.width, //screenWidth?
      height: 24,
      child: Transform.rotate(
        alignment: Alignment.topLeft,
        origin: Offset.zero,
        angle: pi / 2,
        child: Center(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Opacity(
              opacity: 1,
              child: Text(
                'warmful',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildMenuIcon() {
  return Positioned(
    top: 32,
    left: 4,
    child: IconButton(
      icon: const Icon(Icons.menu, color: Colors.white),
      onPressed: () {},
    ),
  );
}

Widget _buildMenuContent() {
  final List<Map> _menus = <Map>[
    {
      "icon": Icons.person,
      "title": "profile",
      "color": Colors.white,
    },
    {
      "icon": Icons.view_agenda,
      "title": "feed",
      "color": Colors.white,
    },
    {
      "icon": Icons.swap_calls,
      "title": "activity",
      "color": Colors.cyan,
    },
    {
      "icon": Icons.settings,
      "title": "settings",
      "color": Colors.white,
    },
  ];

  return Padding(
    padding: const EdgeInsets.only(left: 64, top: 96),
    child: Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: _menus.map((menuItem) {
            return ListTile(
              leading: Icon(
                menuItem["icon"],
                color: menuItem["color"],
              ),
              title: Text(
                menuItem["title"],
                style: TextStyle(
                  color: menuItem["color"],
                  fontSize: 24,
                ),
              ),
            );
          }).toList()),
    ),
  );
}
