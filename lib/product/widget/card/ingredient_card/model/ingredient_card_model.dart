import 'package:flutter/cupertino.dart';
import 'package:recipe/view/home/Ingredient/model/ingredient.dart';

class IngredientCardModel extends ChangeNotifier {
  double amount = 0;
  String? name;
  List<Ingredient> myIngredientCardModelList = [];
}
