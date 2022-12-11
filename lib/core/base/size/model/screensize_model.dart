import 'package:flutter/cupertino.dart';
import 'package:recipe/core/base/size/service/screensize_service.dart';
import 'package:provider/provider.dart';

class ScreenSize extends ChangeNotifier implements IScreenSize {
  late double height;
  late double width;

  @override
  Future<double> getHeight(BuildContext context) async {
    double myGetHeight = putHeight(context) as double;
    return myGetHeight;
  }

  @override
  Future<double> getWidth(BuildContext context) async {
    double myGetWidth = putWidth(context) as double;
    return myGetWidth;
  }

  @override
  Future<double> putHeight(BuildContext context) async {
    double myHeight = Provider.of<ScreenSize>(context, listen: false).height;
    return myHeight;
  }

  @override
  Future<double> putWidth(BuildContext context) async {
    double myWidth = Provider.of<ScreenSize>(context, listen: false).width;
    return myWidth;
  }
}
