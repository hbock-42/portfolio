import 'dart:io';

import 'package:portfolio_app/resources/resources.dart';
import 'package:test/test.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.menu).existsSync(), true);
  });
}
