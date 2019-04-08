import 'package:flutter/material.dart';

class SlideAnimationPage extends StatefulWidget {
  static const routeName = 'slideanimation';

  @override
  SlideCards createState() => SlideCards();
}

class SlideCards extends State<SlideAnimationPage> {
  List<String> images = [
    'assets/image_01.png',
    'assets/image_02.jpg',
    'assets/image_03.jpg',
    'assets/image_04.jpg',
  ];
  List<String> title = [
    "Bill Evans",
    "Miles Davis",
    "John Coltrane",
    "Frank Sinatra"
  ];
  List<String> instrument = ["piano", "trumpet", "saxophone", "vocal"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 30, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Trending',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.0),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      size: 40,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 6),
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 6),
                        child: Text(
                          "Animation",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text("25+ Animations",
                      style: TextStyle(color: Colors.orange)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
