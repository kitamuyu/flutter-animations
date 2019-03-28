import 'package:flutter/material.dart';

class AnimationDialogPage extends StatefulWidget {
  static const routeName = 'animationdialog';
  final VoidCallback onClose;
  const AnimationDialogPage({Key key, this.onClose}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AnimationDialogPageState();
}

class AnimationDialogPageState extends State<AnimationDialogPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> opacityAnimation;
  Animation<double> scaleAnimation;

  final overlayEntry = OverlayEntry(builder: (BuildContext context) {
    return AnimationDialogPage();
  });

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    opacityAnimation = Tween<double>(begin: 0.0, end: 0.4).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  Widget home(BuildContext context) {
    return Scaffold(
        body: Center(
            child: RaisedButton.icon(
                onPressed: () {
                  OverlayEntry overlayEntry;
                  overlayEntry = OverlayEntry(builder: (c) {
                    return AnimationDialogPage(
                        onClose: () => overlayEntry.remove());
                  });
                  Overlay.of(context).insert(overlayEntry);
                },
                icon: Icon(Icons.message),
                label: Text("PopUp!"))));
  }

  Widget _buildDialog(BuildContext context) {
    return Material(
        color: Colors.black.withOpacity(opacityAnimation.value),
        child: Center(
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Container(
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0))),
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: RaisedButton(
                  onPressed: widget.onClose,
                  child: Text('Close!'),
                ),
              ),
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 150.0),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: <Widget>[
          home(context),
          _buildDialog(context),
        ],
      ),
    );
  }
}
