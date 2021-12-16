import 'package:math_expressions/math_expressions.dart';

abstract class MathState {
  String result = '';
  final String userInput;
  MathState({required this.userInput});
}

class AddInput extends MathState {
  AddInput({
    required String userInput,
  }) : super(
          userInput: userInput,
        );
}

class Clear extends MathState {
  Clear({String userInput = ''}) : super(userInput: userInput) {
    super.result = '';
  }
}

class RemoveLast extends MathState {
  RemoveLast({required String userInput})
      : super(
          userInput: userInput.substring(
            0,
            userInput.length - 1,
          ),
        );
}

class Result extends MathState {
  Result({required String userInput}) : super(userInput: userInput) {
    try {
      double eval = Parser().parse(userInput).evaluate(
            EvaluationType.REAL,
            ContextModel(),
          );
      super.result = eval.toString();
    } catch (_) {
      super.result = 'lỗi rồi';
    }
  }
}
