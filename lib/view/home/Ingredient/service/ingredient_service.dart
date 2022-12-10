import 'package:recipe/view/home/Ingredient/model/ingredient.dart';

abstract class IingredientService {
  //Get all INGREDIENT
  Future<List<Ingredient>> findAllProduct(List<Ingredient> myIngredientList) async {
    return myIngredientList;
  }

  //Add
  Future<Ingredient> addProduct(Ingredient myIngredient) async {
    return myIngredient;
  }

  //Delete INGREDIENT
  Future<void> deleteProductById(int id) async {}

  //Made INGREDIENT currently
  Future<Ingredient> updateIngredient(Ingredient myCurrentIngredient) async {
    return myCurrentIngredient;
  }
}
