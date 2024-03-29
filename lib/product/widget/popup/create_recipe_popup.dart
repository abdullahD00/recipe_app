// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/base/size/model/screensize_model.dart';
import 'package:recipe/core/constant/color/color_const.dart';
import 'package:recipe/core/widget/button/customized_button.dart';
import 'package:recipe/core/widget/textfield/gradient_textfield.dart';
import 'package:recipe/product/enum/textfield_hinttext.dart';
import 'package:recipe/product/mixin/recipe_mixin/recipe_service_mixin.dart';
import 'package:recipe/product/widget/popup/create_ingredient_popup.dart';
import 'package:recipe/product/widget/snackbar/bottomsheet_recipe_create.dart';

// ignore: must_be_immutable
class CreateRecipePopUp extends StatelessWidget with RecipeServiceFuncMix {
  CreateRecipePopUp({super.key});

  @override
  Widget build(BuildContext context) {
    var nameTextEditingController = TextEditingController();
    var timeTextEditingController = TextEditingController();
    var typeTextEditingController = TextEditingController();
    var descriptionTextEditingController = TextEditingController();
    List<TextEditingController> textEditingList = [
      nameTextEditingController,
      timeTextEditingController,
      typeTextEditingController,
      descriptionTextEditingController,
    ];
    List<TextInputType> textInputType = [
      TextInputType.number,
      TextInputType.name,
      TextInputType.name,
      TextInputType.name,
    ];

    return AlertDialog(
      backgroundColor: RecipeColor.lightPink,
      title: Center(
        child: Text(
          "CREATE RECIPE",
          style: Theme.of(context).textTheme.displayLarge?.merge(
                createRecipPopUpTitle(),
              ),
        ),
      ),
      content: SizedBox(
        height: Provider.of<ScreenSize>(context).getHeight(context) / 2,
        width: Provider.of<ScreenSize>(context).getWidth(context),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return Gradienttextfield(
              height: Provider.of<ScreenSize>(context).getHeight(context) / 12,
              width: Provider.of<ScreenSize>(context).getWidth(context) / 2,
              colors: [
                RecipeColor.lightPink,
                RecipeColor.myPink,
                RecipeColor.darkPink,
              ],
              inputType: textInputType[index],
              hintText: TextFieldHintText.values[index].name,
              fontSize: 15,
              fontColor: RecipeColor.black,
              controller: textEditingList[index],
              fontWeight: FontWeight.w400,
              radius: 2,
            );
          },
        ),
      ),
      actions: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: GeneralButton(
                onPressedFun: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateIngredientPopUp(),
                    ),
                  );
                },
                buttonWidget: Text(
                  "INGREDIENT",
                  style: Theme.of(context).textTheme.button?.merge(
                        buttonTextStyle(),
                      ),
                ),
                heightButton: Provider.of<ScreenSize>(context).getHeight(context) / 15,
                widthButton: Provider.of<ScreenSize>(context).getWidth(context) / 2.5,
              ),
            ),
            Center(
              child: GeneralButton(
                onPressedFun: () {
                  // addRecipe(
                  //   Recipe(
                  //     id: 1,
                  //     name: "makarna", //nameTextEditingController.text,
                  //     time: 15.0, //double.tryParse(timeTextEditingController.text),
                  //     typeOfMeal: "ana yemek", //typeTextEditingController.text,
                  //     description: "leziz",
                  //   ), //descriptionTextEditingController.text),
                  // );
                  bottomSheetRecipeCreate(context);
                  //go genel recipe list
                },
                buttonWidget: Text(
                  "CREATE",
                  style: Theme.of(context).textTheme.button?.merge(
                        buttonTextStyle(),
                      ),
                ),
                heightButton: Provider.of<ScreenSize>(context).getHeight(context) / 15,
                widthButton: Provider.of<ScreenSize>(context).getWidth(context) / 2.5,
              ),
            ),
          ],
        ),
      ],
    );
  }

  TextStyle buttonTextStyle() {
    return TextStyle(
      color: RecipeColor.white,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle createRecipPopUpTitle() {
    return const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w300,
      color: Colors.pink,
    );
  }

  TextStyle showBottomSheetTextStyle() {
    return TextStyle(
      fontSize: 20,
      color: RecipeColor.white,
      fontWeight: FontWeight.w400,
    );
  }
}
