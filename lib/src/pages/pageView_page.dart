import 'package:flutter/material.dart';

class PageViewPage extends StatelessWidget {
  Widget _buildPage({int index, Color color}) {
    return Container(
      alignment: AlignmentDirectional.center,
      color: color,
      child: Text(
        '$index',
        style: TextStyle(fontSize: 132.0, color: Colors.white),
      ),
    );
  }

  Widget _buildContent() {
    return PageView(
      children: [
        _buildPage(index: 1, color: Colors.green),
        _buildPage(index: 2, color: Colors.blue),
        _buildPage(index: 3, color: Colors.indigo),
        _buildPage(index: 4, color: Colors.red),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page View"),
      ),
      body: Container(color: Colors.lightBlueAccent, child: _buildContent()),
    );
  }
}
