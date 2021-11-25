import 'package:flutter/material.dart';
import 'package:portfolio_app/presentation/views/core/widgets/translation.dart';

import 'screen_sized_box.dart';

class AnimatedPage extends StatefulWidget {
  static const Duration inDuration = Duration(milliseconds: 600);
  static const Duration outDuration = Duration(milliseconds: 400);

  final ScreenSizedBox child;
  final Axis axis;
  final Size screenSize;
  final double itemSize;
  final int itemId;

  const AnimatedPage({
    Key key,
    @required this.child,
    @required this.screenSize,
    @required this.itemSize,
    @required this.itemId,
    this.axis = Axis.horizontal,
  }) : super(key: key);

  @override
  _AnimatedPageState createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage>
    with SingleTickerProviderStateMixin {
  final Duration _duration = AnimatedPage.inDuration + AnimatedPage.outDuration;

  AnimationController _controller;
  double _halfAnimation;

  // offset
  Offset _startOffset;
  final Offset _endOffset = Offset.zero;
  Animation<Offset> _offset;
  Tween<double> _offsetInterval = Tween<double>(begin: 0.0, end: 0.5);

  // size
  Size _startSize;
  Size _endSize;
  Animation<Size> _size;
  Tween<double> _sizeInterval = Tween<double>(begin: 0.5, end: 1.0);

  // position
  Offset _startPosition;
  final Offset _endPosition = Offset.zero;
  Animation<Offset> _position;
  Tween<double> _positionInterval = Tween<double>(begin: 0.5, end: 1.0);

  @override
  void initState() {
    _initializeValues();

    _controller = AnimationController(vsync: this, duration: _duration);

    _initializeOffsetAnimation();
    _initializeSizeAnimation();
    _initializePositionAnimation();
    _initializePositionAnimation();

    _controller.animateTo(_halfAnimation);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initializeValues() {
    _halfAnimation =
        AnimatedPage.inDuration.inMilliseconds / _duration.inMilliseconds;
    print(_halfAnimation);
    _initializeOffsetValues();
    _initializeSizeValues();
    _initializePositionValues();
  }

  //#region offset initialization

  void _initializeOffsetValues() {
    _startOffset = Offset(
        widget.axis == Axis.vertical ? -widget.screenSize.width : 0,
        widget.axis == Axis.horizontal ? -widget.screenSize.height : 0);

    _offsetInterval = Tween<double>(
      begin: _offsetInterval.begin * _halfAnimation,
      end: _offsetInterval.end * _halfAnimation,
    );
  }

  void _initializeOffsetAnimation() {
    _offset = Tween<Offset>(begin: _startOffset, end: _endOffset).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          _offsetInterval.begin,
          _offsetInterval.end,
          curve: Curves.linear,
        ),
      ),
    );
  }

  //#endregion

  //#region size initialization

  void _initializeSizeValues() {
    _startSize = Size(
      widget.axis == Axis.horizontal
          ? widget.itemSize
          : widget.screenSize.width,
      widget.axis == Axis.vertical ? widget.itemSize : widget.screenSize.height,
    );
    _endSize = widget.screenSize;

    _sizeInterval = Tween<double>(
      begin: _sizeInterval.begin * _halfAnimation,
      end: _sizeInterval.end * _halfAnimation,
    );
  }

  void _initializeSizeAnimation() {
    _size = Tween<Size>(begin: _startSize, end: _endSize).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          _sizeInterval.begin,
          _sizeInterval.end,
          curve: Curves.linear,
        ),
      ),
    );
  }

  //#endregion

  //#region position initialization

  void _initializePositionValues() {
    _startPosition = Offset(
      widget.axis == Axis.horizontal ? widget.itemId * widget.itemSize : 0,
      widget.axis == Axis.vertical ? widget.itemId * widget.itemSize : 0,
    );

    _positionInterval = Tween<double>(
      begin: _positionInterval.begin * _halfAnimation,
      end: _positionInterval.end * _halfAnimation,
    );
  }

  void _initializePositionAnimation() {
    _position = Tween<Offset>(begin: _startPosition, end: _endPosition).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          _positionInterval.begin,
          _positionInterval.end,
          curve: Curves.linear,
        ),
      ),
    );
  }

  //#endregion

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          return Positioned(
            width: _size.value.width,
            height: _size.value.height,
            left: _position.value.dx,
            top: _position.value.dy,
            child: Translation(offset: _offset.value, child: widget.child),
          );
        });
  }
}
