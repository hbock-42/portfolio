import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MenuItem extends HookWidget {
  final Color color;
  final void Function(PointerUpEvent) onPointerUp;
  final Widget child;

  const MenuItem({
    Key key,
    @required this.color,
    this.onPointerUp,
    this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: onPointerUp,
      child: Container(
        color: color,
        child: Center(child: child),
      ),
    );
  }
}
