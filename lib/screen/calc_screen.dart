import 'package:calculator_flutter/app_color.dart';
import 'package:calculator_flutter/bloc/math.dart';
import 'package:calculator_flutter/screen/display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalcScreen extends StatelessWidget {
  const CalcScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlocMath, MathState>(
        bloc: BlocMath(),
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              top: 40,
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: AppColor.blackGrayColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(),
                  Display(
                    ali: Alignment.bottomRight,
                    text: context.watch<BlocMath>().state.userInput,
                    flex: 2,
                  ),
                  const Divider(
                    indent: 30,
                    endIndent: 30,
                    color: Colors.white,
                  ),
                  Display(
                    ali: Alignment.topRight,
                    text: context.watch<BlocMath>().state.result,
                    flex: 1,
                  ),
                  const SizedBox(),
                ],
              ),
            ),
          );
        });
  }
}
