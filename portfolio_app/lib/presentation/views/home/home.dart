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
    return Stack(
      children: <Widget>[
        Menu(
          axis: isPortrait ? Axis.horizontal : Axis.vertical,
          hidden: hideMenu.value,
          menuItems: <MenuItem>[
            MenuItem(
              color: Colors.red,
              child: Text(
                'Who am I',
                style: AppTheme.themeData.textTheme.headline1,
              ),
            ),
            MenuItem(
              color: Colors.green,
              child: Text(
                'Projects',
                style: AppTheme.themeData.textTheme.headline1,
              ),
            ),
            MenuItem(
              color: Colors.blue,
              child: Text(
                'CV',
                style: AppTheme.themeData.textTheme.headline1,
              ),
            ),
            MenuItem(
              color: Colors.yellow,
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
