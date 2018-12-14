import 'package:flutter/material.dart';
import 'package:my_examples_app/src/data/models/example_model.dart';
import 'package:my_examples_app/src/data/repositories/examplesList_repository.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final repo = ExamplesListRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Examples"),
      ),
      body: FutureBuilder(
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
                List<Example> values = snapshot.data;
                print(values);
                return _getList(values);
              }
          }
        },
        future: repo.loadExamples(),
      ),
    );
  }

  Widget _getList(List<Example> values) {
    return ListView.builder(
      itemCount: values.length,
      itemBuilder: (context, index) {
        final example = values[index];
        return ListTile(
          onTap: (){
            Navigator.of(context).pushNamed(example.route);
          },
          title: Text(example.title),
          subtitle: Text(example.description),
          leading: Image(
            image: NetworkImage(example.image),
            fit: BoxFit.contain,
            height: 35, ),
          trailing: Icon(Icons.arrow_right),
        );
      },
    );
  }
}
