part of 'calculator_bloc.dart';

class CalculatorState {
  final String firstNumber;
  final String secondNumber;
  final String result;
  final String operation;

  CalculatorState({
    this.firstNumber = "0",
    this.secondNumber = "0",
    this.result = "0",
    this.operation = "NoNe",
  });
}
