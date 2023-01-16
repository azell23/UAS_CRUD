import 'package:flutter/material.dart';

class TextCom extends StatelessWidget {
  const TextCom(this.text, this.size, this.style,this.color);
  final String text;
  final FontWeight style;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: style,
        color: color
      ),
    );
  }
}
