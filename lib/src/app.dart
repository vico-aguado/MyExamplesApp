import 'package:flutter/material.dart';
import 'package:my_examples_app/src/pages/baseline_page.dart';
import 'package:my_examples_app/src/pages/gradientText_page.dart';
import 'package:my_examples_app/src/pages/list_page.dart';
import 'package:my_examples_app/src/pages/rowColumn_page.dart';
import 'package:my_examples_app/src/pages/toImage_page.dart';
import 'package:my_examples_app/src/pages/stack_page.dart';
import 'package:my_examples_app/src/pages/expanded_page.dart';
import 'package:my_examples_app/src/pages/padding_page.dart';
import 'package:my_examples_app/src/pages/pageView_page.dart';
//import 'package:my_examples_app/src/pages/test_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primaryColor: Colors.indigo,
          primarySwatch: Colors.indigo,
        ),
        home: ListPage(),
        initialRoute: '/',
        routes: {
          '/gradient': (BuildContext context) => GradientText(),
          '/rowcolumn': (BuildContext context) => RowColumn(),
          '/baseline': (BuildContext context) => BaseLine(),
          '/toimage': (BuildContext context) => ToImage(),
          '/stack': (BuildContext context) => StackPage(),
          '/expanded': (BuildContext context) => ExpandedPage(),
          '/padding': (BuildContext context) => PaddingPage(),
          '/pageView': (BuildContext context) => PageViewPage(),
        },
      );
  }
}
