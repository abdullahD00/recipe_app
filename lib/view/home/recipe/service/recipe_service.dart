import '../model/recipe.dart';

abstract class IRecipeService {
  //Get all RECİPE
  Future<List<Recipe>?> findAllFood();

  //Add
  Future<void> addRecipe(Recipe myRecipe);

  //Delete RECİPE
  Future<void> deleteRecipeById(int id);

  //Made RECİPE currently
  Future<void> updateRecipe(Recipe myCurrentRecipe, int id);
}
