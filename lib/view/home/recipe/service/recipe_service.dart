import 'package:recipe/view/home/recipe/model/recipe.dart';

abstract class IRecipeService {
  //Add
  Future<Recipe> addRecipe(Recipe myRecipe) async {
    return myRecipe;
  }

  //Get all RECİPE
  Future<List<Recipe>> findAllFood(List<Recipe> myRecipeList) async {
    return myRecipeList;
  }

  //Delete RECİPE
  Future<void> deleteRecipeById(int id) async {}

  //Made RECİPE currently
  Future<Recipe> updateRecipe(Recipe myCurrentRecipe) async {
    return myCurrentRecipe;
  }
}
