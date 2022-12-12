import 'package:flutter/material.dart';
import 'package:recipe/product/widget/card/recipe_card.dart';
import 'package:recipe/view/home/recipe/viewmodel/recipe_viewmode.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class RecipeView extends StatefulWidget {
  const RecipeView({super.key});

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends RecipeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _mycolor.whitePink,
      body: AnimationLimiter(
        child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            children: List.generate(7, (index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                columnCount: 2,
                child: ScaleAnimation(
                  duration: const Duration(milliseconds: 3000),
                  child: FadeInAnimation(
                    child: RecipeCard(
                        ellipticalRadius: const Radius.elliptical(20, 150),
                        name: "name",
                        time: 120,
                        typeOfMeal: "typeOfMeal"),
                  ),
                ),
              );
            })),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: _mycolor.myPink,
        child: Center(
          child: IconButton(
            // ignore: avoid_print
            onPressed: () => print("object"),
            icon: const Icon(
              Icons.no_food_sharp,
              color: Colors.white,
            ),
          ),
        ),
        // ignore: avoid_print
        onPressed: () => print("object"),
      ),
    );
  }
}

// ignore: camel_case_types
class _mycolor {
  static Color myPink = const Color.fromRGBO(249, 97, 99, 1);
  static Color whitePink = const Color.fromRGBO(244, 233, 233, 1);
}
