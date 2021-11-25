import 'package:flutter/material.dart';

import 'presentation/theme/app_theme.dart';
import 'presentation/views/home/home.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hugo\'portfolio',
      home: Material(color: Colors.black45, child: Home()),
      color: Colors.grey,
      theme: AppTheme.themeData,
    );
  }
}
