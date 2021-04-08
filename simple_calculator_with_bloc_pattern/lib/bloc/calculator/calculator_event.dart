part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class AddFirstNumber extends CalculatorEvent {
  final String firstNumber;

  AddFirstNumber(this.firstNumber);
}

class AddSecondNumber extends CalculatorEvent {
  final String secondNumber;

  AddSecondNumber(this.secondNumber);
}

class CalculateResult extends CalculatorEvent {
  final String operation;

  CalculateResult(this.operation);
}

class AddOperation extends CalculatorEvent {
  final String operation;

  AddOperation(this.operation);
}

class ResetAC extends CalculatorEvent {}
