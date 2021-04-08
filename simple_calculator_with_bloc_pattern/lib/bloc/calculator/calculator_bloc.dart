import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState());

  @override
  Stream<CalculatorState> mapEventToState(
    CalculatorEvent event,
  ) async* {
    if (event is AddFirstNumber && state.operation == 'NoNe') {
      yield CalculatorState(
        firstNumber: (state.firstNumber == '0')
            ? event.firstNumber
            : state.firstNumber + event.firstNumber,
        secondNumber: '0',
        result: '0',
        operation: 'NoNe',
      );
    } else if (event is AddSecondNumber && state.operation != 'NoNe') {
      yield CalculatorState(
        firstNumber: state.firstNumber,
        secondNumber: (state.secondNumber == '0')
            ? event.secondNumber
            : state.secondNumber + event.secondNumber,
        result: '0',
        operation: state.operation,
      );
    } else if (event is AddOperation) {
      yield CalculatorState(
        firstNumber: state.firstNumber,
        secondNumber: state.secondNumber,
        result: '0',
        operation: event.operation,
      );
    } else if (event is CalculateResult &&
        state.firstNumber.length > 0 &&
        state.secondNumber.length > 0 &&
        state.operation != 'None') {
      final int result =
          int.parse(state.firstNumber) + int.parse(state.secondNumber);

      yield CalculatorState(
        firstNumber: '0',
        secondNumber: '0',
        result: result.toString(),
        operation: 'NoNe',
      );
    } else if (event is ResetAC) {
      yield CalculatorState(
        firstNumber: '0',
        secondNumber: '0',
        result: '0',
        operation: 'NoNe',
      );
    }
  }
}
