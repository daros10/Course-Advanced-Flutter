import 'package:bloc_simple_calculator/bloc/calculator/calculator_bloc.dart';
import 'package:bloc_simple_calculator/widgets/button_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonsCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calculatorBloc = BlocProvider.of<CalculatorBloc>(context);

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonCalculator(
            buttonText: 'AC',
            color: Colors.orange,
            callback: () => calculatorBloc.add(ResetAC()),
          ),
          ButtonCalculator(
            buttonText: '1',
            callback: () => calculatorBloc.state.operation == 'NoNe'
                ? calculatorBloc.add(AddFirstNumber("1"))
                : calculatorBloc.add(AddSecondNumber("1")),
          ),
          ButtonCalculator(
            buttonText: '2',
            callback: () => calculatorBloc.state.operation == 'NoNe'
                ? calculatorBloc.add(AddFirstNumber("2"))
                : calculatorBloc.add(AddSecondNumber("2")),
          ),
          ButtonCalculator(
            buttonText: '3',
            callback: () => calculatorBloc.state.operation == 'NoNe'
                ? calculatorBloc.add(AddFirstNumber("3"))
                : calculatorBloc.add(AddSecondNumber("3")),
          ),
          ButtonCalculator(
            buttonText: '+',
            color: Colors.green,
            callback: () => calculatorBloc.add(AddOperation("+")),
          ),
        ],
      ),
    );
  }
}
