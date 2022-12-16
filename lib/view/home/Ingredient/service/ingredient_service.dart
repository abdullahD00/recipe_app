import 'package:recipe/view/home/Ingredient/model/ingredient.dart';

abstract class IingredientService {
  //Get all INGREDIENT
  Future<List<Ingredient>> findAllProduct(List<Ingredient> myIngredientList);
  //Add
  Future<Ingredient> addProduct(Ingredient myIngredient);

  //Delete INGREDIENT
  Future<void> deleteProductById(int id);

  //Made INGREDIENT currently
  Future<Ingredient> updateIngredient(Ingredient myCurrentIngredient);
}
