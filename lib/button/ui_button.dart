import 'package:calculator_flutter/app_color.dart';
import 'package:calculator_flutter/button/calc_button.dart';
import 'package:flutter/material.dart';

class ButtonUI extends StatelessWidget {
  int i = 0;
  ButtonUI({Key? key}) : super(key: key);
  final List<String> charButtons = [
    '1',
    '2',
    '3',
    '*',
    '4',
    '5',
    '6',
    '+',
    '7',
    '8',
    '9',
    '-',
    'C',
    'DEL',
    '%',
    '/',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
        left: 10,
      ),
      child: GridView.count(
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2,
        reverse: true,
        crossAxisCount: 2,
        children: buttons(),
      ),
    );
  }

  CalcButton calcButton(String char) {
    return CalcButton(
      buttonColor: AppColor.blackGrayColor,
      char: char,
    );
  }

  CalcButton circleCalcButton(String char) {
    return CalcButton(
        charColor: Colors.black,
        shape: const CircleBorder(),
        buttonColor: AppColor.yellowOrangeColor,
        char: char);
  }

  List<Widget> buttons() {
    List<Widget> buttons = [];
    buttons.add(calcButton('0'));
    buttons.add(
      GridView.count(
        crossAxisCount: 2,
        children: [
          calcButton('.'),
          circleCalcButton('='),
        ],
      ),
    );
    for (var i = 0; i < charButtons.length; i += 4) {
      buttons.add(
        GridView.count(
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            calcButton(charButtons[i]),
            calcButton(charButtons[i + 1]),
          ],
        ),
      );
      buttons.add(
        GridView.count(
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            calcButton(charButtons[i + 2]),
            circleCalcButton(charButtons[i + 3]),
          ],
        ),
      );
    }
    return buttons;
  }
}
