import 'package:flutter/widgets.dart';

abstract class IScreenSize {
  //put HEIGHT
  Future<void> putHeight(BuildContext context) async {}

  //put WIDTH
  Future<void> putWidth(BuildContext context) async {}

  //get ScreenSize HEIGHT
  Future<void> getHeight(BuildContext context) async {}

  //get ScreenSize WIDTH
  Future<void> getWidth(BuildContext context) async {}
}
