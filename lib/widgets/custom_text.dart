import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final List<Shadow> shadow;
  final String text;
  final double fontSize;

  const CustomText({ Key? key,required this.fontSize,required this.shadow,required this.text }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
        fontWeight:FontWeight.bold,
        shadows: shadow
      ),
    );
  }
}