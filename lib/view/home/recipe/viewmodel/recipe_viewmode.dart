import 'package:flutter/cupertino.dart';
import 'package:recipe/product/mixin/recipe_mixin/recipe_service_mixin.dart';
import 'package:recipe/view/home/recipe/view/recipe_view.dart';

abstract class RecipeViewModel extends State<RecipeView> with RecipeServiceFuncMix {
  @override
  void initState() {
    findAllFood().then((value) {
      setState(() {
        recipeList != value;
      });
    });
    super.initState();
  }
}
