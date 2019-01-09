import 'package:flutter/material.dart';
import 'package:my_examples_app/src/widgets/propertiesSelector_widget.dart';

class StackPage extends StatefulWidget {
  _StackPageState createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  bool _useAlignment = true;
  AlignmentDirectional _alignmentDirectional = AlignmentDirectional.topStart;

  AlignmentDirectional alignmentFromIndex(int index) {
    switch (index) {
      case 0:
        return AlignmentDirectional.topStart;
      case 1:
        return AlignmentDirectional.topCenter;
      case 2:
        return AlignmentDirectional.topEnd;
      case 3:
        return AlignmentDirectional.centerStart;
      case 4:
        return AlignmentDirectional.center;
      case 5:
        return AlignmentDirectional.centerEnd;
      case 6:
        return AlignmentDirectional.bottomStart;
      case 7:
        return AlignmentDirectional.bottomCenter;
      case 8:
        return AlignmentDirectional.bottomEnd;
    }
    return AlignmentDirectional.center;
  }

  Widget _buildBar() {
    return Column(
      children: <Widget>[
        Divider(color: Colors.black54),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            PropertiesSelector(
              title: "Type",
              values: [
                'align',
                'position',
              ],
              onChange: (value) {
                _updateType();
              },
            ),
            PropertiesSelector(
              disabled: !_useAlignment,
              title: "Alignment",
              values: [
                'top\nstart',
                'top\ncenter',
                'top\nend',
                'center\nstart',
                'center',
                'center\nend',
                'bottom\nstart',
                'bottom\ncenter',
                'bottom\nend',
              ],
              onChange: (value) {
                _updateAlignment(value);
              },
            )
          ],
        )
      ],
    );
  }

  void _updateAlignment(int index) {
    setState(() {
      _alignmentDirectional = alignmentFromIndex(index);
    });
  }

  void _updateType() {
    setState(() {
      _useAlignment = !_useAlignment;
    });
  }


  List<Widget> _buildChildren(){
    if (_useAlignment) {
      return <Widget>[
          SizedBox(
            width: 300.0,
            height: 300.0,
            child: Container(
              color: Colors.green,
            ),
          ),
          SizedBox(
            width: 200.0,
            height: 200.0,
            child: Container(
              color: Colors.yellow,
            ),
          ),
          SizedBox(
            width: 100.0,
            height: 100.0,
            child: Container(
              color: Colors.red,
            ),
          ),
        ];
    }else{
      return <Widget>[
          SizedBox(
            width: 300.0,
            height: 300.0,
            child: Container(
              color: Colors.yellow,
            ),
          ),
          Positioned(
            left: 20.0,
            top: 20.0,
            width: 100.0,
            height: 100.0,
            child: Container(
              color: Colors.indigo,
            ),
          ),
          Positioned(
            right: 40.0,
            top: 40.0,
            width: 100.0,
            height: 100.0,
            child: Container(
              color: Colors.red,
            ),
          ),
          Positioned(
            left: 40.0,
            bottom: 40.0,
            width: 100.0,
            height: 100.0,
            child: Container(
              color: Colors.green,
            ),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            width: 100.0,
            height: 100.0,
            child: Container(
              color: Colors.blue,
            ),
          ),
        ];
    }
  }

  Widget _buildContent() {
    return Stack(
      alignment: _alignmentDirectional,
      children: _buildChildren(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack"),
        bottom:
            PreferredSize(preferredSize: Size(0.0, 80.0), child: _buildBar()),
      ),
      body: Container(color: Colors.lightBlueAccent, child: _buildContent()),
    );
  }
}
