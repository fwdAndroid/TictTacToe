import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {

final VoidCallback onTap;
final String text;
CustomButtons({required this.onTap,required this.text});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ElevatedButton(
      onPressed: onTap,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width/5, 50)
      ),

      
    );
  }
}