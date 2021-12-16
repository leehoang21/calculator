import 'math.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocMath extends Bloc<MathEvent, MathState> {
  bool flagRemove = false;

  BlocMath() : super(Clear()) {
    on<OrtherButtonsTapped>((event, emit) {
      if (state.result == 'lỗi rồi') {
        emit(Clear(userInput: state.userInput));
      } else if (state.result != '') {
        if (flagRemove) {
          flagRemove = false;
        } else if (!isOperator(event)) {
          emit(AddInput(userInput: state.result));
        } else {
          emit(Clear());
        }
        emit(Clear(userInput: state.userInput));
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

    on<DeleteButtonTapped>((event, emit) {
      flagRemove = true;
      emit(RemoveLast(userInput: state.userInput));
    });

    on<EqualButtonTapped>((event, emit) {
      if (state.userInput[0] == '+' && isNumber1()) {
        emit(
          AddInput(
            userInput: state.userInput.substring(
              1,
              state.userInput.length,
            ),
          ),
        );
      }
      emit(Result(userInput: state.userInput));
    });
  }

  bool isNumber1() {
    return state.userInput[1].compareTo('9') <= 0 &&
        state.userInput[1].compareTo('0') >= 0;
  }

  bool isOperator(OrtherButtonsTapped event) {
    return (event.charUserInput.compareTo('9') <= 0 &&
            event.charUserInput.compareTo('0') >= 0) ||
        event.charUserInput.compareTo('.') == 0;
  }
}
