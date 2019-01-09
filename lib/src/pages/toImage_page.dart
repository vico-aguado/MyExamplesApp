import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ToImage extends StatefulWidget {
  _ToImageState createState() => _ToImageState();
}

class _ToImageState extends State<ToImage> {
  GlobalKey _globalKey = new GlobalKey();

  bool inside = false;
  Uint8List imageInMemory;

  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      inside = true;
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      String bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      print('png done');
      setState(() {
        imageInMemory = pngBytes;
        inside = false;
      });
      return pngBytes;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Widget")),
      body: SingleChildScrollView(
        child: Center(
          child: RepaintBoundary(
            key: _globalKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  'Click the button below to capture image',
                ),
                new RaisedButton(
                  child: Text('capture Image'),
                  onPressed: _capturePng,
                ),
                inside
                    ? CircularProgressIndicator()
                    : imageInMemory != null
                        ? Container(
                            child: Image.memory(imageInMemory),
                            margin: EdgeInsets.all(10))
                        : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
