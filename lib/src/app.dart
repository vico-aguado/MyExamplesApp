import 'package:flutter/material.dart';

import 'package:my_examples_app/src/pages/home_page.dart';
import 'package:my_examples_app/src/pages/test_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primaryColor: Colors.indigo,
          primarySwatch: Colors.indigo,
        ),
        home: Home(),
        initialRoute: '/',
        routes: {
          '/screen1': (BuildContext context) => TestPage(),
          '/screen2': (BuildContext context) => TestPage(),
        },
      );
  }
}