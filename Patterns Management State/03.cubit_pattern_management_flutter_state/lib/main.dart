import 'package:estado_singleton_flutter/bloc/usuario/usuario.cubit.dart';
import 'package:estado_singleton_flutter/pages/firstPag.page.dart';
import 'package:estado_singleton_flutter/pages/secondPage.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => new UsuarioCubit(),
        )
      ],
      child: MaterialApp(
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
