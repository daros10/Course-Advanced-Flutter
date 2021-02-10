import 'package:estado_singleton_flutter/pages/firstPag.page.dart';
import 'package:estado_singleton_flutter/pages/secondPage.page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: "/",
      routes: {
        "/": (_) => FirstPage(),
        "second": (_) => SecondPage(),
      },
    );
  }
}
