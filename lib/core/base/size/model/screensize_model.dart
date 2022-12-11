import 'package:flutter/cupertino.dart';
import 'package:recipe/core/base/size/service/screensize_service.dart';
import 'package:provider/provider.dart';

class ScreenSize extends ChangeNotifier implements IScreenSize {
  late double height;
  late double width;

  @override
  Future<double> getHeight(BuildContext context, double myHeight) async {
    // TODO: implement getHeight
    throw UnimplementedError();
  }

  @override
  Future<double> getWidth(BuildContext context, double myWidth) async {
    // TODO: implement getWidth
    throw UnimplementedError();
  }

  @override
  Future<double> putHeight(BuildContext context, double myHeight) async {
    myHeight = Provider.of<ScreenSize>(context, listen: false).height;
    return myHeight;
  }

  @override
  Future<double> putWidth(BuildContext context, double myWidth) async {
    // TODO: implement putWidth
    throw UnimplementedError();
  }
}
