import 'package:flutter/material.dart';
import 'package:recipe/view/authenticate/splash/model/splash_model.dart';
import 'package:recipe/view/authenticate/splash/service/splash_service.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:provider/provider.dart';
import 'package:recipe/view/home/recipe/view/recipe_view.dart';

abstract class SplashScreenViewModel extends StatelessWidget implements ISplashService {
  const SplashScreenViewModel({super.key});
  final String lottieUrlThinking = "https://assets4.lottiefiles.com/packages/lf20_ysas4vcp.json";
  final String lottieUrlLoading = "https://assets10.lottiefiles.com/private_files/lf30_cjoryulu.json";

  @override
  Future<void> checkEthernetConenction(BuildContext context) async {
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

  @override
  Future<void> skipNextPage(BuildContext context) async {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RecipeView()));
    });
  }

  @override
  Future<void> getStart(BuildContext context) async {
    makeCheckInternetDefault(context);
    checkEthernetConenction(context);
    if (Provider.of<Splash>(context, listen: false).checkEthernet) {
      skipNextPage(context);
    } else {
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return const AlertDialog(
            title: Text("No Internet Connection!"),
          );
        },
      );
    }
  }
}
