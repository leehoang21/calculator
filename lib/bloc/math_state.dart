abstract class MathState {
  String userInput;
  MathState({required this.userInput});
}

class AddInput extends MathState {
  AddInput({required String userInput}) : super(userInput: userInput);
}

class Clear extends MathState {
  Clear() : super(userInput: '');
}

class RemoveLast extends MathState {
  RemoveLast({required String userInput}) : super(userInput: userInput);
}

class Result extends MathState {
  Result({required String userInput}) : super(userInput: userInput);
}
