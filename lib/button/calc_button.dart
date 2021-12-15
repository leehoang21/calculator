import '/bloc/math.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalcButton extends StatelessWidget {
  final Color buttonColor;
  final Color? charColor;
  final CircleBorder? shape;
  final String char;
  const CalcButton({
    Key? key,
    required this.buttonColor,
    this.charColor,
    this.shape,
    required this.char,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocMath, MathState>(
        bloc: BlocMath(),
        builder: (context, state) {
          return ElevatedButton(
            style: TextButton.styleFrom(
              backgroundColor: buttonColor,
              shape: shape,
            ),
            child: Text(
              char,
              style: TextStyle(
                fontSize: 25,
                color: charColor,
              ),
            ),
            onPressed: () {
              if (char == '=') {
                context.read<BlocMath>().add(EqualButtonTapped());
              } else if (char == 'C') {
                context.read<BlocMath>().add(ClearButtonTapped());
              } else if (char == 'DEL') {
                context.read<BlocMath>().add(DeleteButtonTapped());
              } else {
                context
                    .read<BlocMath>()
                    .add(OrtherButtonsTapped(charUserInput: char));
              }
            },
          );
        });
  }
}
