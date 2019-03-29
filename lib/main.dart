import 'package:flutter/material.dart';
import 'package:my_app/Dialogs/AlertDialog.dart';
import 'package:my_app/Dialogs/AnimationDialog.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: (Page("Animations")),
      title: 'Flutter Animation',
      routes: {
        AlertDialogPage.routeName: (context) => AlertDialogPage(),
        AnimationDialogPage.routeName: (context) => AnimationDialogPage(),
      },
    );
  }
}

class Page extends StatelessWidget {
  final String _pageTitle;

  Page(this._pageTitle) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageTitle),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.album),
            title: Text('AlertDialog'),
            onTap: () {
              Navigator.pushNamed(
                context,
                AlertDialogPage.routeName,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('AnimationDialog'),
            onTap: () {
              Navigator.pushNamed(
                context,
                AnimationDialogPage.routeName,
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.battery_full),
            title: Text('StatefulAnimation'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
