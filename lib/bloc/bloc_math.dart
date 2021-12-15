import 'math.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

class BlocMath extends Bloc<MathEvent, MathState> {
  String _result = '';
  bool flagRemove = false;
  String get result => _result;

  BlocMath() : super(Clear()) {
    on<OrtherButtonsTapped>((event, emit) {
      if (_result == 'lỗi rồi') {
        if (flagRemove) {
          flagRemove = false;
        } else {
          emit(Clear());
        }
        _result = '';
      } else if (_result != '') {
        if (flagRemove) {
          flagRemove = false;
        } else if (!isOperator(event)) {
          emit(AddInput(userInput: _result));
        } else {
          emit(Clear());
        }

        _result = '';
      }
      emit(
        AddInput(userInput: state.userInput + event.charUserInput),
      );
    });

    on<ClearButtonTapped>(
      (event, emit) {
        _result = '';
        emit(Clear());
      },
    );

    on<DeleteButtonTapped>((event, emit) {
      flagRemove = true;
      emit(
        RemoveLast(
          userInput: state.userInput.substring(
            0,
            state.userInput.length - 1,
          ),
        ),
      );
    });

    on<EqualButtonTapped>((event, emit) {
      try {
        if (state.userInput[0] == '+' && isNumber()) {
          emit(
            AddInput(
              userInput: state.userInput.substring(
                1,
                state.userInput.length,
              ),
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
      emit(Result(userInput: state.userInput));
    });
  }

  bool isNumber() {
    return state.userInput[1].compareTo('9') <= 0 &&
        state.userInput[1].compareTo('0') >= 0;
  }

  bool isOperator(OrtherButtonsTapped event) {
    return (event.charUserInput.compareTo('9') <= 0 &&
            event.charUserInput.compareTo('0') >= 0) ||
        event.charUserInput.compareTo('.') == 0;
  }
}
