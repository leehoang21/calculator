import '/button/ui_button.dart';
import '/screen/calc_screen.dart';
import '/bloc/math.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider<BlocMath>(
      create: (_) => BlocMath(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const Expanded(
            child: CalcScreen(),
            flex: 3,
          ),
          Expanded(
            flex: 8,
            child: ButtonUI(),
          ),
        ],
      ),
    );
  }
}
