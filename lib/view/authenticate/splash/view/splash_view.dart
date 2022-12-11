import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recipe/core/widget/wrapper/wrapper.dart';
import 'package:recipe/view/authenticate/splash/model/splash_model.dart';
import 'package:recipe/view/authenticate/splash/viewmodel/splash_viewmodel.dart';
import 'package:provider/provider.dart';

class SplashScreenView extends SplashScreenViewModel {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () {
        makeCheckInternetDefault(context);
        checkEthernetConenction(context);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              Lottie.network(lottieUrlThinking),
              Text(
                "RECIPE",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 60,
                      fontWeight: FontWeight.w300,
                      color: Colors.pink,
                    ),
              ),
              SizedBox(
                height: 250,
                child: Provider.of<Splash>(context, listen: false).checkEthernet
                    ? Lottie.network(lottieUrlLoading)
                    //
                    : const Text("No Ithernet!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
