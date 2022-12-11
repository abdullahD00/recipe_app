import 'package:flutter/material.dart';
import 'package:recipe/core/base/size/model/screensize_model.dart';
import 'package:recipe/view/authenticate/splash/model/splash_model.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:recipe/view/home/recipe/view/recipe_view.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //Splash Screen Provider
        ChangeNotifierProvider<Splash>(
          create: ((context) => Splash()),
        ),
        //Screen Size Provider
        ChangeNotifierProvider<ScreenSize>(
          create: ((context) => ScreenSize()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const RecipeView(),
      ),
    );
  }
}
