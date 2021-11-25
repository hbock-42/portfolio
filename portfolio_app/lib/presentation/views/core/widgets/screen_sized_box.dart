import 'package:flutter/material.dart';

class ScreenSizedBox extends StatelessWidget {
  final Widget child;

  const ScreenSizedBox({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: child,
    );
  }
}
