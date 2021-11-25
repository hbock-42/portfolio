import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:portfolio_app/presentation/theme/app_theme.dart';

import '../menu_bar/menu_bar.dart';
import '../menu_bar/menu_item.dart';

class Home extends HookWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    bool isPortrait = screenSize.width < screenSize.height;
    ValueNotifier<bool> hideMenu = useState(false);
    List<ValueNotifier<bool>> listIsHovering =
        List<ValueNotifier<bool>>.generate(4, (int index) => useState(false));
    return Stack(
      children: <Widget>[
        Menu(
          axis: isPortrait ? Axis.horizontal : Axis.vertical,
          menuItems: <MenuItem>[
            MenuItem(
              color: Colors.red,
              hidden: listIsHovering[0].value ? false : hideMenu.value,
              onEnter: (_) => listIsHovering[0].value = true,
              onExit: (_) => listIsHovering[0].value = false,
              child: Text(
                'Who am I',
                style: AppTheme.themeData.textTheme.headline1,
              ),
            ),
            MenuItem(
              color: Colors.green,
              hidden: listIsHovering[1].value ? false : hideMenu.value,
              onEnter: (_) => listIsHovering[1].value = true,
              onExit: (_) => listIsHovering[1].value = false,
              child: Text(
                'Projects',
                style: AppTheme.themeData.textTheme.headline1,
              ),
            ),
            MenuItem(
              color: Colors.blue,
              hidden: listIsHovering[2].value ? false : hideMenu.value,
              onEnter: (_) => listIsHovering[2].value = true,
              onExit: (_) => listIsHovering[2].value = false,
              child: Text(
                'CV',
                style: AppTheme.themeData.textTheme.headline1,
              ),
            ),
            MenuItem(
              color: Colors.yellow,
              hidden: listIsHovering[3].value ? false : hideMenu.value,
              onEnter: (_) => listIsHovering[3].value = true,
              onExit: (_) => listIsHovering[3].value = false,
              child: Text(
                'Contact',
                style: AppTheme.themeData.textTheme.headline1,
              ),
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () => hideMenu.value = !hideMenu.value,
          child: Text(hideMenu.value ? 'show' : 'hide'),
        ),
      ],
    );
  }
}
