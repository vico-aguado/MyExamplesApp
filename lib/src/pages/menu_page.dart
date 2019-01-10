import 'package:flutter/material.dart';
import 'package:my_examples_app/src/data/models/example_model.dart';
import 'package:my_examples_app/src/data/repositories/examplesList_repository.dart';

class MenuPage extends StatelessWidget {
  MenuPage({this.title, this.values});

  final List<Example> values;
  final String title;
  final _repo = ExamplesListRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title != null ? title : "My Examples"),
      ),
      body: _getItems(),
    );
  }

  Widget _getItems() {
    if (this.values == null) {
      return FutureBuilder(
        initialData: [],
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return new Text('None');
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.indigo,
                ),
              );
            default:
              if (snapshot.hasError) {
                return new Text('Error: ${snapshot.error}');
              } else {
                List<Example> _values = snapshot.data;
                return _getList(_values);
              }
          }
        },
        future: _repo.loadExamples(),
      );
    } else {
      return _getList(this.values);
    }
  }

  Widget _getList(List<Example> values) {
    return ListView.builder(
      itemCount: values.length,
      itemBuilder: (context, index) {
        final example = values[index];
        return ListTile(
          onTap: () {
            if (example.subRoutes.length == 0) {
              Navigator.of(context).pushNamed(example.route);
            } else {
              print(example.subRoutes);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MenuPage(
                            values: example.subRoutes,
                            title: example.title,
                          )));
            }
          },
          title: Text(example.title),
          subtitle: Text(example.description),
          leading: Image(
            image: NetworkImage(example.image),
            fit: BoxFit.contain,
            height: 35,
          ),
          trailing: Icon(Icons.arrow_right),
        );
      },
    );
  }
}
