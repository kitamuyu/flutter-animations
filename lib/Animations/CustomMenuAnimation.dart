import 'package:flutter/material.dart';
import 'dart:math';

class CustomMenuPage extends StatefulWidget {
  static const routeName = 'custommenu';

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<CustomMenuPage> {
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

class _GuillotineState extends State<Guillotine>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animationMenu;
  Animation<double> animationTitleInOut;
  _GuillotineAnimationStatus menuAnimationStatus;

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

  @override
  void initState() {
    super.initState();
    menuAnimationStatus = _GuillotineAnimationStatus.closed;

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _controller.addListener(() {});

    animationMenu = Tween(
      begin: -pi / 2,
      end: 0,
    ).animate(CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceOut,
        reverseCurve: Curves.bounceIn))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.completed:
            menuAnimationStatus = _GuillotineAnimationStatus.open;
            break;
          case AnimationStatus.dismissed:
            menuAnimationStatus = _GuillotineAnimationStatus.closed;
            break;
          default:
            menuAnimationStatus = _GuillotineAnimationStatus.animating;
        }
      });

    animationTitleInOut = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: _controller, curve: Interval(0, 0.5, curve: Curves.ease)));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _playAnimation() {
    try {
      switch (menuAnimationStatus) {
        case _GuillotineAnimationStatus.animating:
          break;
        case _GuillotineAnimationStatus.closed:
          _controller.forward().orCancel;
          break;
        default:
          _controller.reverse().orCancel;
      }
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    double angle = animationMenu.value;

    return Transform.rotate(
      angle: angle,
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
              Positioned(
                top: 32,
                left: 40,
                width: screenWidth,
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
                        opacity: animationTitleInOut.value,
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
              ),
              Positioned(
                top: 32,
                left: 4,
                child: IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: _playAnimation,
                ),
              ),
              Padding(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum _GuillotineAnimationStatus { closed, open, animating }
