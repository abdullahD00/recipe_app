import 'package:flutter/material.dart';
import 'package:recipe/core/constant/color/color_const.dart';
import 'package:recipe/product/mixin/recipe_mixin/recipe_service_mixin.dart';

// ignore: must_be_immutable
class RecipeDetailPopUp extends StatelessWidget with RecipeServiceFuncMix {
  RecipeDetailPopUp({
    Key? key,
    required this.id,
  }) : super(key: key);
  int id;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.menu),
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () {
            deleteRecipeById(id);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.delete,
                color: RecipeColor.myPink,
              ),
              const Text("DELETE"),
            ],
          ),
        ),
        PopupMenuItem(
          onTap: () {
            //show update pop up!
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.update,
                color: RecipeColor.myPink,
              ),
              const Text("UPDATE"),
            ],
          ),
        ),
      ],
    );
  }
}
