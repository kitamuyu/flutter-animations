import 'package:flutter/material.dart';

class AnimationDialogPage extends StatelessWidget {
  static const routeName = 'animationdialog';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: RaisedButton.icon(
                onPressed: () {
                  OverlayEntry overlayEntry;
                  overlayEntry = OverlayEntry(builder: (c) {
                    return AnimationDialog(
                        onClose: () => overlayEntry.remove());
                  });
                  Overlay.of(context).insert(overlayEntry);
                },
                icon: Icon(Icons.message),
                label: Text("PopUp!"))));
  }
}

class AnimationDialog extends StatefulWidget {
  final VoidCallback onClose;
  const AnimationDialog({Key key, this.onClose}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AnimationDialogState();
}

class AnimationDialogState extends State<AnimationDialog>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> opacityAnimation;
  Animation<double> scaleAnimation;

  final overlayEntry = OverlayEntry(builder: (BuildContext context) {
    return AnimationDialog();
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

  @override
  Widget build(BuildContext context) {
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
}
