import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../resources/resources.dart';
import '../../theme/app_theme.dart';
import '../core/widgets/fitted_text.dart';
import '../core/widgets/screen_sized_box.dart';
import '../menu_bar/menu_bar.dart';
import '../menu_bar/menu_item.dart';

class Home extends HookWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isPortrait = screenSize.width < screenSize.height;
    ValueNotifier<bool> hideMenu = useState(false);
    return Stack(
      children: <Widget>[
        Stack(
          children: <Widget>[
            ScreenSizedBox(child: Container(color: Colors.red)),
            ScreenSizedBox(child: Container(color: Colors.green)),
            ScreenSizedBox(child: Container(color: Colors.blue)),
            ScreenSizedBox(child: Container(color: Colors.yellow)),
          ],
        ),
        Menu(
          axis: isPortrait ? Axis.horizontal : Axis.vertical,
          hidden: hideMenu.value,
          menuItems: <MenuItem>[
            MenuItem(
              color: Colors.red,
              child: FittedText(
                'Who am I',
                style: AppTheme.themeData.textTheme.headline1,
              ),
            ),
            MenuItem(
              color: Colors.green,
              child: FittedText(
                'Projects',
                style: AppTheme.themeData.textTheme.headline1,
              ),
            ),
            MenuItem(
              color: Colors.blue,
              child: FittedText(
                'CV',
                style: AppTheme.themeData.textTheme.headline1,
              ),
            ),
            MenuItem(
              color: Colors.yellow,
              child: FittedText(
                'Contact',
                style: AppTheme.themeData.textTheme.headline1,
              ),
            ),
          ],
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
