import 'package:flutter/cupertino.dart';
import 'package:recipe/view/home/recipe/service/recipe_service.dart';
import 'package:recipe/view/home/recipe/view/recipe_view.dart';

abstract class RecipeViewModel extends State<RecipeView> with IRecipeService {}
