import 'package:flutter/material.dart';

import 'home.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hugo\'portfolio',
      home: Home(),
      color: Colors.grey,
    );
  }
}
