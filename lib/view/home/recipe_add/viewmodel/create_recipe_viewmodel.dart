import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipe/core/constant/color/color_const.dart';
import 'package:recipe/product/mixin/recipe_mixin.dart/recipe_service_mixin.dart';
import 'package:recipe/view/home/Ingredient/model/ingredient.dart';
import 'package:recipe/view/home/recipe_add/view/create_recipe_view.dart';

abstract class CreateRecipeViewModel extends State<CreateRecipeView> with RecipeServiceFuncMix {
  var nameTextEditingController = TextEditingController();
  var timeTextEditingController = TextEditingController();
  var typeTextEditingController = TextEditingController();
  var descriptionTextEditingController = TextEditingController();
  List<Ingredient>? ingredientList = [Ingredient()];
  void goBackPage(BuildContext context) {
    Navigator.pop(context);
  }

  void clearTextEditingRecipeValue() {
    nameTextEditingController.clear();
    timeTextEditingController.clear();
    typeTextEditingController.clear();
    descriptionTextEditingController.clear();
  }

  TextStyle createRecipTitle() {
    return TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w300,
      color: RecipeColor.darkPink,
    );
  }

  TextStyle textFieldHintText() {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: RecipeColor.darkPink,
    );
  }

  InputDecoration textFieldDecoration(String labelText, IconData suffixIcon) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: textFieldHintText(),
      suffixIcon: Padding(
        padding: const EdgeInsets.all(9.0),
        child: FaIcon(suffixIcon, color: RecipeColor.darkPink),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: RecipeColor.darkPink,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }
}
