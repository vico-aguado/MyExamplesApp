import 'package:flutter/material.dart';

class NestedPage extends StatelessWidget {
  Widget _buildContent() {
    return ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext content, int index) {
          return _buildHorizontalList(parentIndex: index);
        });
  }

  Widget _buildHorizontalList({int parentIndex}) {
    var colors = [
      Colors.green,
      Colors.blue,
      Colors.indigo,
      Colors.red,
      Colors.orange
    ];
    double height = 136.0;
    return SizedBox(
      height: height,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (BuildContext content, int index) {
            return _buildItem(
              index: index + 1,
              color: colors[(parentIndex + index) % colors.length],
              parentSize: height,
            );
          }),
    );
  }

  Widget _buildItem({int index, Color color, double parentSize}) {
    double edgeSize = 8.0;
    double itemSize = parentSize - edgeSize * 2.0;
    return Container(
      padding: EdgeInsets.all(edgeSize),
      child: SizedBox(
        width: itemSize,
        height: itemSize,
        child: Container(
          alignment: AlignmentDirectional.center,
          color: color,
          child: Text(
            '$index',
            style: TextStyle(fontSize: 72.0, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nested")),
      body: Container(color: Colors.white, child: _buildContent()),
    );
  }
}
