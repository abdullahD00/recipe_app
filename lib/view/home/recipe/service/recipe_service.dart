import 'package:recipe/view/home/recipe/model/recipe.dart';

abstract class IRecipeService {
  //Get all RECİPE
  Future<List<Recipe>?> findAllFood();

  //Add
  Future<bool> addRecipe(Recipe myRecipe);

  //Delete RECİPE
  Future<bool> deleteRecipeById(int id);

  //Made RECİPE currently
  Future<bool> updateRecipe(Recipe myCurrentRecipe, int id);
}
