import 'package:flutter/cupertino.dart';
import 'package:recipe/view/authenticate/splash/model/splash_model.dart';
import 'package:recipe/view/authenticate/splash/service/splash_service.dart';
// ignore: depend_on_referenced_packages
import 'package:internet_connection_checker/internet_connection_checker.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

abstract class SplashScreenViewModel extends StatelessWidget implements ISplashService {
  const SplashScreenViewModel({super.key});
  final String lottieUrlThinking = "https://assets4.lottiefiles.com/packages/lf20_ysas4vcp.json";
  final String lottieUrlLoading = "https://assets10.lottiefiles.com/private_files/lf30_cjoryulu.json";

  @override
  Future<void> checkEthernetConenction(BuildContext context) async {
    // ignore: unused_local_variable
    bool result = await InternetConnectionChecker().hasConnection;
    if (result == true) {
      // ignore: use_build_context_synchronously
      changeCheckInternet(context);
      // ignore: avoid_print
      print("Internet Connection available!");
    } else {
      // ignore: use_build_context_synchronously
      changeCheckInternet(context);
      // ignore: avoid_print
      print("Internet Connection is not available!");
    }
  }

  @override
  Future<void> changeCheckInternet(BuildContext context) async {
    Provider.of<Splash>(context, listen: false).checkEthernet =
        !Provider.of<Splash>(context, listen: false).checkEthernet;
    ChangeNotifier();
  }

  @override
  Future<void> makeCheckInternetDefault(BuildContext context) async {
    Provider.of<Splash>(context, listen: false).checkEthernet = false;
  }
}
