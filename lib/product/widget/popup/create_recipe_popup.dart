import 'package:flutter/material.dart';
import 'package:gradient_textfield/gradient_textfield.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/base/size/model/screensize_model.dart';
import 'package:recipe/core/constant/color/color_const.dart';

class CreateRecipePopUp extends StatelessWidget {
  const CreateRecipePopUp({super.key});

  @override
  Widget build(BuildContext context) {
    var nameTextEditingController = TextEditingController();
    var timeTextEditingController = TextEditingController();
    var typeTextEditingController = TextEditingController();
    return AlertDialog(
      backgroundColor: RecipeColor.lightPink,
      title: Text(
        "CREATE RECIPE",
        style: Theme.of(context).textTheme.displayLarge?.merge(
              createRecipPopUpTitle(),
            ),
      ),
      content: SizedBox(
        height: Provider.of<ScreenSize>(context, listen: false).getHeight(context) / 1.5,
        width: Provider.of<ScreenSize>(context, listen: false).getWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Text("Name"),
            Gradienttextfield(
              height: Provider.of<ScreenSize>(context).getHeight(context) / 30,
              width: Provider.of<ScreenSize>(context).getWidth(context) / 2,
              colors: [
                RecipeColor.lightPink,
                RecipeColor.myPink,
                RecipeColor.darkPink,
              ],
              text: "Name",
              controller: nameTextEditingController,
            ),
          ],
        ),
      ),
    );
  }

  TextStyle createRecipPopUpTitle() {
    return const TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.w300,
      color: Colors.pink,
    );
  }
}
