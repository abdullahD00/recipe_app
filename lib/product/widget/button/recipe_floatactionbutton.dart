import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:recipe/core/constant/color/color_const.dart';
import 'package:recipe/view/home/recipe_add/view/create_recipe_view.dart';

Radius ellipticalRadiusTop = const Radius.elliptical(200, 100);
Radius ellipticalRadiusBottom = const Radius.elliptical(100, 200);

AnimationConfiguration recipeAddFloatActionButton(BuildContext context) {
  return AnimationConfiguration.synchronized(
    child: ScaleAnimation(
      duration: const Duration(milliseconds: 700),
      child: FadeInAnimation(
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: ellipticalRadiusTop,
              bottomLeft: ellipticalRadiusBottom,
              topRight: ellipticalRadiusTop,
              bottomRight: ellipticalRadiusBottom,
            ),
          ),
          backgroundColor: RecipeColor.myPink,
          child: Center(
              child: Icon(
            Icons.no_food_sharp,
            color: RecipeColor.white,
          )),
          // ignore: avoid_print
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateRecipeView(),
              ),
            );
            // showDialog(
            //     context: context,
            //     builder: (BuildContext context) {
            //       return CreateRecipePopUp();
            //     });
          },
        ),
      ),
    ),
  );
}
