import 'package:flutter/material.dart';
import 'package:recipe/core/constant/color/color_const.dart';
import 'package:recipe/product/widget/button/recipe_floatactionbutton.dart';
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
      backgroundColor: RecipeColor.lightPink,
      body: AnimationLimiter(
        child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            children: List.generate(recipeList!.length, (index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                columnCount: 2,
                child: ScaleAnimation(
                  duration: const Duration(milliseconds: 700),
                  child: FadeInAnimation(
                    child: RecipeCard(
                      name: recipeList![index].name ?? "name could not be loaded",
                      time: recipeList![index].time!,
                      typeOfMeal: recipeList![index].typeOfMeal ?? "Type of Meal could not be loaded",
                    ),
                  ),
                ),
              );
            })),
      ),
      floatingActionButton: recipeAddFloatActionButton(context),
    );
  }
}
