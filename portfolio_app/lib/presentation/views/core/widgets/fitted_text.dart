import 'package:flutter/material.dart';

class FittedText extends StatelessWidget {
  final String text;
  final double horizontalPadding;
  final TextStyle style;

  const FittedText(
    this.text, {
    Key key,
    this.horizontalPadding = 5.0,
    this.style,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Text(text, style: style),
      ),
    );
  }
}
