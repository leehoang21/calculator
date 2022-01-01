import 'package:math_expressions/math_expressions.dart';

abstract class MathState {
  final String result;
  final String userInput;
  MathState({required this.userInput, this.result = ''});
}

class AddInput extends MathState {
  AddInput({required String userInput}) : super(userInput: userInput);
}

class Clear extends MathState {
  Clear({String userInput = ''}) : super(userInput: userInput);
}

class RemoveLast extends MathState {
  RemoveLast({required String userInput}) : super(userInput: userInput);
}

class Result extends MathState {
  Result({required String userInput, required String result})
      : super(userInput: userInput, result: result);
}
