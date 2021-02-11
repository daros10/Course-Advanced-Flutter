import 'package:estado_singleton_flutter/pages/firstPag.page.dart';
import 'package:estado_singleton_flutter/pages/secondPage.page.dart';
import 'package:estado_singleton_flutter/services/user.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new UserService(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: "/",
        routes: {
          "/": (_) => FirstPage(),
          "second": (_) => SecondPage(),
        },
      ),
    );
  }
}
