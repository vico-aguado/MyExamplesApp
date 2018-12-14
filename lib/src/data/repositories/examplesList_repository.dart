import 'dart:async' show Future;
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:my_examples_app/src/data/models/example_model.dart';

class ExamplesListRepository {

  Future<String> _loadExamplesAsset() async {
    return await rootBundle.loadString('lib/src/data/repositories/static/examplesList.json');
  }

  List<Example> _parseJson(String jsonString){
    Map decoded = jsonDecode(jsonString);

    List<Example> examples = List<Example>();
    for(var example in decoded["examples"]){
      final item = Example.fromJson(example);
      examples.add(item);
    }

    return examples;
  }

  Future<List<Example>> loadExamples () async {
    final json = await _loadExamplesAsset();
    return _parseJson(json);
  }

}