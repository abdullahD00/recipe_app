import 'package:recipe/view/home/recipe/model/recipe.dart';

abstract class IRecipeService {
  //Get all RECİPE
  Future<List<Recipe>?> findAllFood() async {
    return null;
  }

  //Add
  Future<Recipe> addRecipe(Recipe myRecipe) async {
    return myRecipe;
  }

  //Delete RECİPE
  Future<void> deleteRecipeById(int id) async {}

  //Made RECİPE currently
  Future<Recipe> updateRecipe(Recipe myCurrentRecipe) async {
    return myCurrentRecipe;
  }
}
