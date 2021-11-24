import 'package:flutter/material.dart';

import 'home.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hugo\'portfolio',
      home: Container(
        color: Colors.grey,
        child: Home(),
      ),
      color: Colors.grey,
    );
  }
}
