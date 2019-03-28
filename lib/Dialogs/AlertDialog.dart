import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class AlertDialogPage extends StatefulWidget {
  static const routeName = 'alertdialog';

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<AlertDialogPage> {
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

    _flutterTapRecognizer = TapGestureRecognizer()
      ..onTap = () => _openUrl(flutterUrl);
    _githubTapRecognizer = TapGestureRecognizer()
      ..onTap = () => _openUrl(githubUrl);
  }

  @override
  void dispose() {
    _flutterTapRecognizer.dispose();
    _githubTapRecognizer.dispose();
    super.dispose();
  }

  void _openUrl(String url) async {
    Navigator.pop(context);

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget home(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: const Text('Show Pop-up'),
          color: Theme.of(context).accentColor,
          elevation: 4.0,
          splashColor: Colors.amberAccent,
          textColor: const Color(0xFFFFFFFF),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildDialog(context),
            );
          },
        ),
      ],
    );
  }

  Widget _buildDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Hello, Pop up.'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildText(),
        ],
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        )
      ],
    );
  }

  Widget _buildText() {
    return RichText(
      text: TextSpan(
        text:
            'Android Popup Menu displays the menu below the anchor text if space is available otherwise above the anchor text. It disappears if you click outside the popup menu.\n\n',
        style: const TextStyle(color: Colors.black87),
        children: <TextSpan>[
          const TextSpan(text: 'The app was developed with '),
          TextSpan(
            text: 'Flutter',
            recognizer: _flutterTapRecognizer,
            style: linkStyle,
          ),
          const TextSpan(
            text: ' and it\'s open source. check out the source '
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 150.0),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: <Widget>[
          home(context),
        ],
      ),
    );
  }
}
