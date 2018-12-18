import 'package:flutter/material.dart';
import 'package:my_examples_app/src/widgets/propertiesSelector_widget.dart';

class RowColumn extends StatefulWidget {
  @override
  _RowColumnState createState() => new _RowColumnState();
}

class _RowColumnState extends State<RowColumn> {
  bool _isRow = true;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.start;
  MainAxisSize _mainAxisSize = MainAxisSize.min;

  static const elements = [
    Icon(Icons.mood, size: 50.0),
    Icon(Icons.mood, size: 100.0),
    Icon(Icons.mood, size: 50.0),
  ];

  MainAxisAlignment _mainAxisAlignmentFromIndex(int index) {
    switch (index) {
      case 0:
        return MainAxisAlignment.start;
      case 1:
        return MainAxisAlignment.end;
      case 2:
        return MainAxisAlignment.center;
      case 3:
        return MainAxisAlignment.spaceBetween;
      case 4:
        return MainAxisAlignment.spaceAround;
      case 5:
        return MainAxisAlignment.spaceEvenly;
    }
    return MainAxisAlignment.start;
  }

  CrossAxisAlignment _crossAxisAlignmentFromIndex(int index) {
    switch (index) {
      case 0:
        return CrossAxisAlignment.start;
      case 1:
        return CrossAxisAlignment.end;
      case 2:
        return CrossAxisAlignment.center;
      case 3:
        return CrossAxisAlignment.stretch;
      case 4:
        return CrossAxisAlignment.baseline;
    }
    return CrossAxisAlignment.start;
  }

  void _updateLayout() {
    setState(() {
      _isRow = !_isRow;
    });
  }

  void _updateMainAxisSize() {
    setState(() {
      _mainAxisSize = _mainAxisSize == MainAxisSize.min
          ? MainAxisSize.max
          : MainAxisSize.min;
    });
  }

  void _updateMainAxisAlignment(int index) {
    setState(() {
      _mainAxisAlignment = _mainAxisAlignmentFromIndex(index);
    });
  }

  void _updateCrossAxisAlignment(int index) {
    setState(() {
      _crossAxisAlignment = _crossAxisAlignmentFromIndex(index);
    });
  }

  Widget _getIcoMainAxisSize() {
    if (_isRow) {
      return RotatedBox(
          child: Icon(_mainAxisSize == MainAxisSize.min
              ? Icons.unfold_less
              : Icons.unfold_more),
          quarterTurns: 1);
    } else {
      return Icon(_mainAxisSize == MainAxisSize.min
          ? Icons.unfold_less
          : Icons.unfold_more);
    }
  }

  Widget _buildContent() {
    if (_isRow) {
      return Row(
        mainAxisAlignment: _mainAxisAlignment,
        crossAxisAlignment: _crossAxisAlignment,
        mainAxisSize: _mainAxisSize,
        children: elements,
      );
    } else {
      return Column(
        mainAxisAlignment: _mainAxisAlignment,
        crossAxisAlignment: _crossAxisAlignment,
        mainAxisSize: _mainAxisSize,
        children: elements,
      );
    }
  }

  Widget _buildBar() {
    return Column(
      children: <Widget>[
        Divider(color: Colors.black54),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Layout: ",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                IconButton(
                  icon: Icon(_isRow ? Icons.view_agenda : Icons.view_week),
                  color: Colors.white,
                  onPressed: () {
                    _updateLayout();
                  },
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "Main Axis Size: ",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                IconButton(
                  icon: _getIcoMainAxisSize(),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      _updateMainAxisSize();
                    });
                  },
                )
              ],
            )
          ],
        ),
        Divider(color: Colors.black54),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            PropertiesSelector(
              title: "Main Axis Aligment",
              values: [
                'start',
                'end',
                'center',
                'space\nbetween',
                'space\naround',
                'space\nevenly'
              ],
              onChange: (value) {
                _updateMainAxisAlignment(value);
              },
            ),
            PropertiesSelector(
              title: "Cross Axis Aligment",
              values: ['start', 'end', 'center', 'stretch'],
              onChange: (value) {
                _updateCrossAxisAlignment(value);
              },
            )
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Row / Col"),
        bottom:
            PreferredSize(preferredSize: Size(0.0, 130.0), child: _buildBar()),
      ),
      body: Container(color: Colors.lightBlueAccent, child: _buildContent()),
    );
  }
}
