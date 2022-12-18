import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/base/size/model/screensize_model.dart';
import 'package:recipe/core/constant/color/color_const.dart';
import 'package:recipe/core/widget/button/customized_button.dart';
import 'package:recipe/view/home/recipe/view/recipe_view.dart';

Future<dynamic> bottomSheetRecipeCreate(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: RecipeColor.myPink,
    barrierColor: RecipeColor.transparent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    ),
    context: context,
    builder: (context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: SizedBox(
          height: Provider.of<ScreenSize>(context).getHeight(context) / 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Registration was successful!",
                style: Theme.of(context).textTheme.displayLarge?.merge(
                      showBottomSheetTextStyle(),
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: GeneralButton(
                  onPressedFun: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RecipeView(),
                      ),
                    );
                  },
                  buttonColor: RecipeColor.lightPink,
                  buttonWidget: Text(
                    "GO!",
                    style: Theme.of(context).textTheme.displayLarge?.merge(
                          createRecipBottomSheetButton(),
                        ),
                  ),
                  heightButton: Provider.of<ScreenSize>(context).getHeight(context) / 20,
                  widthButton: Provider.of<ScreenSize>(context).getWidth(context) / 4,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

TextStyle createRecipBottomSheetButton() {
  return TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: RecipeColor.myPink,
  );
}

TextStyle showBottomSheetTextStyle() {
  return TextStyle(
    fontSize: 20,
    color: RecipeColor.white,
    fontWeight: FontWeight.w400,
  );
}
