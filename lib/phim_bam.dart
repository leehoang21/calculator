import 'package:flutter/material.dart';

class Phim extends StatelessWidget {
  final int chiSoFlex;
  final Color mauNut;
  final Color? mauText;
  final CircleBorder? hinhDangNut;
  final String text;
  final Function onPressed;
  const Phim({
    Key? key,
    required this.mauNut,
    this.mauText,
    this.hinhDangNut,
    required this.text,
    required this.onPressed,
    required this.chiSoFlex,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
          style: TextButton.styleFrom(
            backgroundColor: mauNut,
            shape: hinhDangNut,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 50,
              color: mauText,
            ),
          ),
          onPressed: () => onPressed(text),
        ),
      ),
      flex: chiSoFlex,
    );
  }
}
