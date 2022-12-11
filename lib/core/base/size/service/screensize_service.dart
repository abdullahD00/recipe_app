import 'package:flutter/widgets.dart';

abstract class IScreenSize {
  //put HEIGHT
  void putHeight(BuildContext context) {}

  //put WIDTH
  void putWidth(BuildContext context) {}

  //get ScreenSize HEIGHT
  void getHeight(BuildContext context) {}

  //get ScreenSize WIDTH
  void getWidth(BuildContext context) {}
}
