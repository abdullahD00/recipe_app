import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});
  final String lottieUrlThinking = "https://assets4.lottiefiles.com/packages/lf20_ysas4vcp.json";
  final String lottieUrlLoading = "https://assets10.lottiefiles.com/private_files/lf30_cjoryulu.json";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            SizedBox(height: 250, child: Lottie.network(lottieUrlLoading)),
          ],
        ),
      ),
    );
  }
}
