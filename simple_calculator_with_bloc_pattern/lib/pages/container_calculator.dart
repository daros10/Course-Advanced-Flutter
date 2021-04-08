import 'package:bloc_simple_calculator/bloc/calculator/calculator_bloc.dart';
import 'package:bloc_simple_calculator/widgets/buttons_calculator.dart';
import 'package:bloc_simple_calculator/widgets/show_result.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContainerCalcultaror extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ShowResult("${state.firstNumber}"),
              ShowResult("${state.operation}"),
              ShowResult("${state.secondNumber}"),
              Divider(),
              ShowResult("${state.result}"),
              SizedBox(
                height: 30,
              ),
              ButtonsCalculator(),
              ButtonResult()
            ],
          ),
        );
      },
    );
  }
}

class ButtonResult extends StatelessWidget {
  const ButtonResult({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          BlocProvider.of<CalculatorBloc>(context).add(CalculateResult('NoNe')),
      customBorder: CircleBorder(),
      child: Container(
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 20,
        ),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black38,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              offset: Offset(2.0, 1.0), //(x,y)
              blurRadius: 5.0,
            ),
          ],
        ),
        child: Center(
          child: Text(
            "=",
            style: TextStyle(color: Colors.white, fontSize: 35),
          ),
        ),
      ),
    );
  }
}
