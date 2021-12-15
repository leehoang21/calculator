import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final Alignment ali;
  final String text;
  final int flex;
  const Display(
      {Key? key, required this.ali, required this.text, required this.flex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: ali,
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      flex: flex,
    );
  }
}
