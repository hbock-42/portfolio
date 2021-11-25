import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../resources/resources.dart';
import '../../theme/app_theme.dart';
import '../core/widgets/animated_page.dart';
import '../core/widgets/fitted_text.dart';
import '../core/widgets/screen_sized_box.dart';
import '../menu_bar/helpers/menu_item_size.dart';
import '../menu_bar/menu_bar.dart';
import '../menu_bar/menu_item.dart';

class Home extends HookWidget {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> hideMenu = useState(false);
    ValueNotifier<int> activeMenuId = useState(0);

    Size screenSize = MediaQuery.of(context).size;
    bool isPortrait = screenSize.width < screenSize.height;
    Axis axis = isPortrait ? Axis.horizontal : Axis.vertical;

    List<Color> colors = <Color>[
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow,
    ];

    List<MenuItem> menuItems = <MenuItem>[
      MenuItem(
        color: colors[0],
        onPointerUp: (_) => activeMenuId.value = 0,
        child: FittedText(
          'Who am I',
          style: AppTheme.themeData.textTheme.headline1,
        ),
      ),
      MenuItem(
        color: colors[1],
        onPointerUp: (_) => activeMenuId.value = 1,
        child: FittedText(
          'Projects',
          style: AppTheme.themeData.textTheme.headline1,
        ),
      ),
      MenuItem(
        color: colors[2],
        onPointerUp: (_) => activeMenuId.value = 2,
        child: FittedText(
          'CV',
          style: AppTheme.themeData.textTheme.headline1,
        ),
      ),
      MenuItem(
        color: colors[3],
        onPointerUp: (_) => activeMenuId.value = 3,
        child: FittedText(
          'Contact',
          style: AppTheme.themeData.textTheme.headline1,
        ),
      ),
    ];

    double itemSize = menuItemSize(axis, screenSize, menuItems.length);

    List<AnimatedPage> animatedPage = <AnimatedPage>[
      if (activeMenuId.value == 0)
        AnimatedPage(
          key: ValueKey<String>('AnimatedPage0'),
          axis: axis,
          screenSize: screenSize,
          itemSize: itemSize,
          itemId: 0,
          child: ScreenSizedBox(
            child: Container(color: colors[0]),
          ),
        ),
      if (activeMenuId.value == 1)
        AnimatedPage(
          key: ValueKey<String>('AnimatedPage1'),
          axis: axis,
          screenSize: screenSize,
          itemSize: itemSize,
          itemId: 1,
          child: ScreenSizedBox(
            child: Container(color: colors[1]),
          ),
        ),
      if (activeMenuId.value == 2)
        AnimatedPage(
          key: ValueKey<String>('AnimatedPage2'),
          axis: axis,
          screenSize: screenSize,
          itemSize: itemSize,
          itemId: 2,
          child: ScreenSizedBox(
            child: Container(color: colors[2]),
          ),
        ),
      if (activeMenuId.value == 3)
        AnimatedPage(
          key: ValueKey<String>('AnimatedPage3'),
          axis: axis,
          screenSize: screenSize,
          itemSize: itemSize,
          itemId: 3,
          child: ScreenSizedBox(
            child: Container(color: colors[3]),
          ),
        ),
    ];

    return Stack(
      children: <Widget>[
        Stack(children: animatedPage),
        Menu(
          axis: axis,
          hidden: hideMenu.value,
          menuItems: menuItems,
        ),
        Positioned(
          width: 50,
          height: 50,
          top: 6,
          left: 6,
          child: IconButton(
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onPressed: () => hideMenu.value = !hideMenu.value,
            icon: Image(
              image: AssetImage(Images.menu),
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
