import 'package:flutter/material.dart';

double menuItemSize(Axis axis, Size screenSize, int itemCount) {
  return axis == Axis.horizontal
      ? screenSize.width / itemCount
      : screenSize.height / itemCount;
}
