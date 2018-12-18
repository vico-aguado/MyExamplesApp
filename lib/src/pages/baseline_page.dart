import 'package:flutter/material.dart';
import 'package:my_examples_app/src/widgets/propertiesSelector_widget.dart';

class BaseLine extends StatefulWidget {
  _BaseLineState createState() => _BaseLineState();
}

class _BaseLineState extends State<BaseLine> {
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.baseline;

  CrossAxisAlignment _crossAxisAlignmentFromIndex(int index) {
    switch (index) {
      case 0:
        return CrossAxisAlignment.baseline;
      case 1:
        return CrossAxisAlignment.start;
      case 2:
        return CrossAxisAlignment.end;
      case 3:
        return CrossAxisAlignment.center;
      case 4:
        return CrossAxisAlignment.stretch;
    }
    return CrossAxisAlignment.start;
  }

  void _updateCrossAxisAlignment(int index) {
    setState(() {
      _crossAxisAlignment = _crossAxisAlignmentFromIndex(index);
    });
  }

  Widget _buildBar() {
    return Column(
      children: <Widget>[
        Divider(color: Colors.black54),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            PropertiesSelector(
              title: "Cross Axis Aligment",
              values: [
                'baseline',
                'start',
                'end',
                'center',
                //'stretch',
              ],
              onChange: (value) {
                _updateCrossAxisAlignment(value);
              },
            )
          ],
        )
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        Container(
          color: Colors.orangeAccent,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: _crossAxisAlignment,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                'Hello',
                style: TextStyle(fontSize: 24.0, color: Colors.yellowAccent),
              ),
              SizedBox(width: 5.0),
              Text(
                'Flutter',
                style: TextStyle(fontSize: 32.0, color: Colors.red),
              ),
              SizedBox(width: 5.0),
              Text(
                'You\'re',
                style: TextStyle(fontSize: 18.0, color: Colors.indigo),
              ),
              SizedBox(width: 5.0),
              Text(
                'Great',
                style: TextStyle(fontSize: 26.0, color: Colors.greenAccent),
              ),
            ],
          ),
        ),
        SizedBox(height: 30.0),
        Container(
          color: Colors.orangeAccent,
          child: Row(
            crossAxisAlignment: _crossAxisAlignment,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                'Big',
                style: TextStyle(fontSize: 48.0, color: Colors.yellowAccent),
              ),
              SizedBox(width: 5.0),
              Text(
                'Medium',
                style: TextStyle(fontSize: 32.0, color: Colors.red),
              ),
              SizedBox(width: 5.0),
              Text(
                'Small',
                style: TextStyle(fontSize: 16.0, color: Colors.indigo),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baseline"),
        bottom:
            PreferredSize(preferredSize: Size(0.0, 80.0), child: _buildBar()),
      ),
      body: Container(color: Colors.lightBlueAccent, child: _buildContent()),
    );
  }
}
