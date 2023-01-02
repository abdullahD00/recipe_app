import 'package:flutter/cupertino.dart';
import 'package:recipe/core/constant/color/color_const.dart';
import 'package:recipe/view/home/recipe_add/view/create_recipe_view.dart';

abstract class CreateRecipeViewModel extends State<CreateRecipeView> {
  var nameTextEditingController = TextEditingController();
  var timeTextEditingController = TextEditingController();
  var typeTextEditingController = TextEditingController();
  var descriptionTextEditingController = TextEditingController();

  void goBackPage(BuildContext context) {
    Navigator.pop(context);
  }

  void clearRecipeValue() {
    //clear recip
    //e textfield
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
}
