import 'package:calculator_flutter/app_color.dart';
import 'package:calculator_flutter/button/calc_button.dart';
import 'package:flutter/material.dart';

class ButtonUI extends StatelessWidget {
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
        left: 10,
        right: 10,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              reverse: true,
              itemCount: charButtons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                var row4 = index % 4 == 3;
                if (row4) {
                  return circleCalcButton(charButtons[index]);
                } else {
                  return calcButton(charButtons[index]);
                }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: GridView.count(
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 2,
              children: [
                calcButton('0'),
                GridView.count(
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: [
                    calcButton('.'),
                    circleCalcButton('='),
                  ],
                ),
              ],
            ),
          ),
        ],
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
}
