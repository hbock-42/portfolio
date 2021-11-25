import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MenuItem extends HookWidget {
  final Color color;
  final bool hidden;
  final void Function(PointerEnterEvent) onEnter;
  final void Function(PointerExitEvent) onExit;
  final Widget child;

  const MenuItem({
    Key key,
    @required this.color,
    this.onEnter,
    this.onExit,
    this.child,
    this.hidden = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: onEnter,
      onExit: onExit,
      child: Container(
        color: color,
        child: Center(child: child),
      ),
    );
  }
}
