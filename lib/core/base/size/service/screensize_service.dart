import 'package:flutter/widgets.dart';

abstract class IScreenSize {
  //put HEIGHT
  Future<double> putHeight(BuildContext context, double myHeight) async {
    return myHeight;
  }

  //put WIDTH
  Future<double> putWidth(BuildContext context, double myWidth) async {
    return myWidth;
  }

  //get ScreenSize HEIGHT
  Future<double> getHeight(BuildContext context, double myHeight) async {
    return myHeight;
  }

  //get ScreenSize WIDTH
  Future<double> getWidth(BuildContext context, double myWidth) async {
    return myWidth;
  }
}
