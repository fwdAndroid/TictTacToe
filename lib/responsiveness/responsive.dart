import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {

final Widget child;
Responsive({required this.child});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(constraints: BoxConstraints(
        maxWidth:900,
        
      ),child: child,),
      
    );
  }
}