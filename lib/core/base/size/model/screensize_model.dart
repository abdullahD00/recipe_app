import 'package:flutter/cupertino.dart';
import 'package:recipe/core/base/size/service/screensize_service.dart';
import 'package:provider/provider.dart';

class ScreenSize extends ChangeNotifier implements IScreenSize {
  late double height;
  late double width;

  @override
  double getHeight(BuildContext context) {
    double myGetHeight = putHeight(context);
    ChangeNotifier();
    return myGetHeight;
  }

  @override
  double getWidth(BuildContext context) {
    double myGetWidth = putWidth(context);
    ChangeNotifier();
    return myGetWidth;
  }

  @override
  double putHeight(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    Provider.of<ScreenSize>(context, listen: false).height = myHeight;
    return myHeight;
  }

  @override
  double putWidth(BuildContext context) {
    double myWidth = MediaQuery.of(context).size.width;
    Provider.of<ScreenSize>(context, listen: false).width = myWidth;
    return myWidth;
  }
}
