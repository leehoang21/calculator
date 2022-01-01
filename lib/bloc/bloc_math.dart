import 'math.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

class BlocMath extends Bloc<MathEvent, MathState> {
  BlocMath() : super(Clear()) {
    on<OrtherButtonsTapped>((event, emit) {
      if (state.result == 'lỗi rồi') {
        emit(Clear());
      } else if (state.result != '') {
        if (isOperator(event)) {
          emit(AddInput(userInput: state.result));
        } else {
          emit(Clear());
        }
      }
      emit(
        AddInput(userInput: state.userInput + event.charUserInput),
      );
    });

    on<ClearButtonTapped>(
      (event, emit) {
        emit(Clear());
      },
    );

    on<DeleteButtonTapped>(
      (event, emit) => emit(
        RemoveLast(
          userInput: state.userInput.substring(0, state.userInput.length - 1),
        ),
      ),
    );

    on<EqualButtonTapped>((event, emit) {
      String _result = '';
      try {
        if (state.userInput[0] == '+' && isNumber()) {
          emit(
            AddInput(
              userInput: state.userInput.substring(1, state.userInput.length),
            ),
          );
        }
        double eval = Parser().parse(state.userInput).evaluate(
              EvaluationType.REAL,
              ContextModel(),
            );
        _result = eval.toString();
      } catch (_) {
        _result = 'lỗi rồi';
      }
      emit(Result(userInput: state.userInput, result: _result));
    });
  }

  bool isNumber() {
    return state.userInput[1].compareTo('9') <= 0 &&
        state.userInput[1].compareTo('0') >= 0;
  }

  bool isOperator(OrtherButtonsTapped event) {
    return !((event.charUserInput.compareTo('9') <= 0 &&
            event.charUserInput.compareTo('0') >= 0) ||
        event.charUserInput.compareTo('.') == 0);
  }
}
