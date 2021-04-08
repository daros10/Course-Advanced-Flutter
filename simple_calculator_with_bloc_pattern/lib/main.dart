import 'package:bloc_simple_calculator/bloc/calculator/calculator_bloc.dart';
import 'package:bloc_simple_calculator/pages/container_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CalculatorBloc>(create: (_) => CalculatorBloc()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bloc Simple Calculator'),
        ),
        body: Center(
          child: ContainerCalcultaror(),
        ),
      ),
    );
  }
}
