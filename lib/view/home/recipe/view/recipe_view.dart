import 'package:flutter/material.dart';
import 'package:recipe/core/base/size/model/screensize_model.dart';
import 'package:recipe/product/widget/card/recipe_card.dart';
import 'package:recipe/view/home/recipe/viewmodel/recipe_viewmode.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';

class RecipeView extends StatefulWidget {
  const RecipeView({super.key});

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends RecipeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 15),
      body: Center(
        child: SizedBox(
            height: Provider.of<ScreenSize>(context).getHeight(context) / 3,
            width: Provider.of<ScreenSize>(context).getWidth(context) / 2.1,
            child: RecipeCard(
              name: "YEMEK", //it's gonna be change!!!
              time: 120,
              typeOfMeal: "ANA YEMEK",
              ellipticalRadius: const Radius.elliptical(20, 150),
            )),
      ),
    );
  }
}
