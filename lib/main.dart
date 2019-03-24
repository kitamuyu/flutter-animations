import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home()
    );
  }
}

class Home extends StatefulWidget{
  const Home();
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  static const String flutterUrl = 'https://flutter.io/';
  static const String githubUrl = 'https://github.com/kitamuyu';

  static const TextStyle linkStyle = const TextStyle(
    color: Colors.blue,
    decoration: TextDecoration.underline,
  );

  TapGestureRecognizer _flutterTapRecognizer;
  TapGestureRecognizer _githubTapRecognizer;

  @override
  void initState() {
    super.initState();
    _flutterTapRecognizer = TapGestureRecognizer()..onTap = () => _openUrl(flutterUrl);
    _githubTapRecognizer = TapGestureRecognizer()..onTap = () => _openUrl(githubUrl);
  }

  @override
  void dispose() {
    _flutterTapRecognizer.dispose();
    _githubTapRecognizer.dispose();
    super.dispose();
  }

  void _openUrl(String url) async {
    // Close the about dialog.
    Navigator.pop(context);

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget home(BuildContext context) {
    return Material(
      child: RaisedButton(
        child: const Text('Show Pop-up'),
        color: Theme.of(context).accentColor,
        elevation: 4.0,
        splashColor: Colors.amberAccent,
        textColor: const Color(0xFFFFFFFF),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildAboutDialog(context),
          );
          // Perform some action
        },
      ),
    );
  }

  Widget _buildAboutDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('About Pop up'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildAboutText(),
          _buildLogoAttribution(),
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Okay, got it!'),
        ),FlatButton(
          onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) => _buildAboutDialog(context),
              );// Perform some action
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Show more popup'),
        ),
      ],
    );
  }

  Widget _buildAboutText() {
    return RichText(
      text: TextSpan(
        text: 'Android Popup Menu displays the menu below the anchor text if space is available otherwise above the anchor text. It disappears if you click outside the popup menu.\n\n',
        style: const TextStyle(color: Colors.black87),
        children: <TextSpan>[
          const TextSpan(text: 'The app was developed with '),
          TextSpan(
            text: 'Flutter',
            recognizer: _flutterTapRecognizer,
            style: linkStyle,
          ),
          const TextSpan(
            text: ' and it\'s open source; check out the source '
                'code yourself from ',
          ),
          TextSpan(
            text: 'https://github.com/kitamuyu',
            recognizer: _githubTapRecognizer,
            style: linkStyle,
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }

  Widget _buildLogoAttribution() {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        children: <Widget>[
          const Expanded(
            child: const Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: const Text(
                'Popup window is like a dialog box that gains complete focus when it appears on screen.',
                style: const TextStyle(fontSize: 12.0),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.only(top: 100.0),

      color: Theme.of(context).scaffoldBackgroundColor,

      child: Column(
        children: <Widget>[
          home(context),
        ],
      ),
    );
  }
}