import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/base/size/model/screensize_model.dart';
import 'package:recipe/core/constant/color/color_const.dart';

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
            ],
          ),
        ),
      );
    },
  );
}

TextStyle showBottomSheetTextStyle() {
  return TextStyle(
    fontSize: 20,
    color: RecipeColor.white,
    fontWeight: FontWeight.w400,
  );
}
