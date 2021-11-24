import 'package:flutter/material.dart';

import 'animated_translation.dart';
import 'menu_item.dart';

class Menu extends StatelessWidget {
  static const double hideRatio = 3 / 5;
  final List<MenuItem> menuItems;
  final Axis axis;

  const Menu({
    Key key,
    @required this.menuItems,
    this.axis = Axis.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Stack(
        children: getMenuItems(constraints),
      );
    });
  }

  List<Widget> getMenuItems(BoxConstraints constraints) {
    List<Widget> positionedItems = <Widget>[];
    double size = axis == Axis.horizontal
        ? constraints.maxWidth / menuItems.length
        : constraints.maxHeight / menuItems.length;
    double width = size;
    double height = size;
    int itemCount = menuItems.length;
    double intervalLength = 1.0 / itemCount;

    for (int i = 0; i < itemCount; i++) {
      double intervalStart = 1.0 * i / itemCount;
      bool hidden = menuItems[i].hidden;
      positionedItems.add(
        AnimatedPositioned(
          width: width,
          height: height,
          left: axis == Axis.horizontal ? i * width : 0,
          top: axis == Axis.horizontal ? 0 : i * height,
          duration: Duration(milliseconds: 600),
          curve: Interval(
            intervalStart,
            intervalStart + intervalLength,
            curve: Curves.easeInOut,
          ),
          child: AnimatedTranslation(
            offset: Offset(
                axis == Axis.horizontal ? 0 : (hidden ? -width * hideRatio : 0),
                axis == Axis.horizontal
                    ? (hidden ? -height * hideRatio : 0)
                    : 0),
            duration: Duration(milliseconds: 400),
            child: menuItems[i],
            curve: Curves.easeOutCubic,
          ),
        ),
      );
    }

    return positionedItems;
  }
}
