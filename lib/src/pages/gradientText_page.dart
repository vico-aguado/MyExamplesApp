import 'package:flutter/material.dart';

class GradientText extends StatefulWidget {
  _GradientTextState createState() => _GradientTextState();
}

class _GradientTextState extends State<GradientText> {
  //
  // a key to set on our Text widget, so we can measure later
  GlobalKey myTextKey = GlobalKey();
  // a RenderBox object to use in state
  RenderBox myTextRenderBox;

  Shader getTextGradient(
      RenderBox renderBox, Color firstColor, Color secondColor) {
    if (renderBox == null) return null;
    return LinearGradient(
      colors: <Color>[firstColor, secondColor],
    ).createShader(Rect.fromLTWH(
        renderBox.localToGlobal(Offset.zero).dx,
        renderBox.localToGlobal(Offset.zero).dy,
        renderBox.size.width,
        renderBox.size.height));
  }

  Shader getLinearGradient(Color firstColor, Color secondColor) {
    return LinearGradient(
      colors: <Color>[firstColor, secondColor],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  }

  @override
  void initState() {
    super.initState();
    // this will be called after first draw, and then call _recordSize() method
    WidgetsBinding.instance.addPostFrameCallback((_) => _recordSize());
  }

  void _recordSize() {
    // now we set the RenderBox and trigger a redraw
    setState(() {
      myTextRenderBox = myTextKey.currentContext.findRenderObject();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gradient Text'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hello Gradients!',
              key: myTextKey,
              style: new TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  //background: Paint()..color = Colors.black12,
                  //foreground: Paint()..shader = getTextGradient(myTextRenderBox)),
                  foreground: Paint()
                    ..shader = getLinearGradient(Colors.pink, Colors.green)),
            ),
            SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                text: 'Don\'t tax the South ',
                style: TextStyle(
                    fontSize: 40.0,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.cyan,
                    decorationStyle: TextDecorationStyle.dashed,
                    foreground: Paint()
                      ..shader = getLinearGradient(Colors.blue, Colors.red)),
                children: <TextSpan>[
                  TextSpan(
                    text: 'cuz',
                    style: TextStyle(
                        fontSize: 40.0,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.red,
                        decorationStyle: TextDecorationStyle.double,
                        foreground: Paint()
                          ..shader =
                              getLinearGradient(Colors.indigo, Colors.orange)),
                  ),
                  TextSpan(
                    text: ' we got it made in the shade',
                    style: TextStyle(
                        fontSize: 40.0,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                        decorationStyle: TextDecorationStyle.dotted,
                        foreground: Paint()
                          ..shader =
                              getLinearGradient(Colors.teal, Colors.yellow)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
