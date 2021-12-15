abstract class MathEvent {}

class OrtherButtonsTapped extends MathEvent {
  final String charUserInput;

  OrtherButtonsTapped({required this.charUserInput});
}

class ClearButtonTapped extends MathEvent {}

class DeleteButtonTapped extends MathEvent {}

class EqualButtonTapped extends MathEvent {}
