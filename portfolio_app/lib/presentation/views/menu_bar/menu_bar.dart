import 'package:flutter/material.dart';

import '../core/widgets/animated_translation.dart';
import 'menu_item.dart';

class Menu extends StatefulWidget {
  static const double hideRatio = 3 / 5;
  final List<MenuItem> menuItems;
  final Axis axis;
  final bool hidden;

  const Menu({
    Key key,
    @required this.menuItems,
    this.axis = Axis.horizontal,
    this.hidden = false,
  }) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _indexCurrentHovered;
  final BoxDecoration _boxDecoration = BoxDecoration(
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        offset: Offset(5.0, 5.0),
        blurRadius: 10.0,
        spreadRadius: 3.0,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double size = widget.axis == Axis.horizontal
          ? constraints.maxWidth / widget.menuItems.length
          : constraints.maxHeight / widget.menuItems.length;
      return AnimatedTranslation(
        offset: Offset(
          widget.axis == Axis.horizontal ? 0 : (widget.hidden ? -size : 0),
          widget.axis == Axis.horizontal ? (widget.hidden ? -size : 0) : 0,
        ),
        duration: Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
        child: Stack(
          children: _getMenuItems(constraints),
        ),
      );
    });
  }

  List<Widget> _getMenuItems(BoxConstraints constraints) {
    List<Widget> positionedItems = <Widget>[];
    double size = widget.axis == Axis.horizontal
        ? constraints.maxWidth / widget.menuItems.length
        : constraints.maxHeight / widget.menuItems.length;
    double width = size;
    double height = size;
    int itemCount = widget.menuItems.length;
    double intervalLength = 1.0 / itemCount;

    for (int i = 0; i < itemCount; i++) {
      double intervalStart = 1.0 * i / itemCount;
      // todo: refactor This big widget
      AnimatedPositioned positionedItem = AnimatedPositioned(
        key: ValueKey<int>(i),
        width: width,
        height: height,
        left: widget.axis == Axis.horizontal ? i * width : 0,
        top: widget.axis == Axis.horizontal ? 0 : i * height,
        duration: Duration(milliseconds: 600),
        curve: Interval(
          intervalStart,
          intervalStart + intervalLength,
          curve: Curves.easeInOut,
        ),
        child: AnimatedTranslation(
          offset: Offset(_indexCurrentHovered == i ? 10.0 : 0.0,
              _indexCurrentHovered == i ? 10.0 : 0.0),
          duration: Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          child: MouseRegion(
            onEnter: (_) => setState(() => _indexCurrentHovered = i),
            onExit: (_) => setState(() => _indexCurrentHovered = null),
            // todo: animate decoration transition
            child: Container(
              decoration: _indexCurrentHovered == i ? _boxDecoration : null,
              child: widget.menuItems[i],
            ),
          ),
        ),
      );
      positionedItems.add(positionedItem);
    }
    if (_indexCurrentHovered != null) {
      Widget currentHovered = positionedItems[_indexCurrentHovered];
      positionedItems.removeAt(_indexCurrentHovered);
      positionedItems.add(currentHovered);
    }

    return positionedItems;
  }
}
