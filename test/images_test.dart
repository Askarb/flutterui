import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:classwork/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.img1).existsSync(), true);
    expect(File(Images.img2).existsSync(), true);
  });
}
