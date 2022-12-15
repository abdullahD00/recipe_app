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
    var descriptionTextEditingController = TextEditingController();
    return AlertDialog(
      backgroundColor: RecipeColor.lightPink,
      title: Text(
        "CREATE RECIPE",
        style: Theme.of(context).textTheme.displayLarge?.merge(
              createRecipPopUpTitle(),
            ),
      ),
      content: SizedBox(
        height: Provider.of<ScreenSize>(context, listen: false).getHeight(context),
        width: Provider.of<ScreenSize>(context, listen: false).getWidth(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Text("Name"),
            Gradienttextfield(
              height: Provider.of<ScreenSize>(context).getHeight(context) / 15,
              width: Provider.of<ScreenSize>(context).getWidth(context) / 2,
              colors: [
                RecipeColor.lightPink,
                RecipeColor.myPink,
                RecipeColor.darkPink,
              ],
              text: "Name",
              fontSize: 15,
              fontColor: RecipeColor.black,
              controller: nameTextEditingController,
              fontWeight: FontWeight.w400,
              radius: 2,
            ),
            Gradienttextfield(
              height: Provider.of<ScreenSize>(context).getHeight(context) / 15,
              width: Provider.of<ScreenSize>(context).getWidth(context) / 2,
              colors: [
                RecipeColor.lightPink,
                RecipeColor.myPink,
                RecipeColor.darkPink,
              ],
              text: "Time",
              fontSize: 15,
              fontColor: RecipeColor.black,
              controller: timeTextEditingController,
              fontWeight: FontWeight.w400,
              radius: 2,
            ),
            Gradienttextfield(
              height: Provider.of<ScreenSize>(context).getHeight(context) / 15,
              width: Provider.of<ScreenSize>(context).getWidth(context) / 2,
              colors: [
                RecipeColor.lightPink,
                RecipeColor.myPink,
                RecipeColor.darkPink,
              ],
              text: "Type",
              fontSize: 15,
              fontColor: RecipeColor.black,
              controller: typeTextEditingController,
              fontWeight: FontWeight.w400,
              radius: 2,
            ),
            Gradienttextfield(
              height: Provider.of<ScreenSize>(context).getHeight(context) / 15,
              width: Provider.of<ScreenSize>(context).getWidth(context) / 2,
              colors: [
                RecipeColor.lightPink,
                RecipeColor.myPink,
                RecipeColor.darkPink,
              ],
              text: "Description",
              fontSize: 15,
              fontColor: RecipeColor.black,
              controller: descriptionTextEditingController,
              fontWeight: FontWeight.w400,
              radius: 2,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: RecipeColor.myPink,
                ),
                onPressed: () {
                  // ignore: avoid_print
                  print("create button clicked");
                },
                child: const Text("CREATE"),
              ),
            )
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
//list view kullan cotroller +1 liste üzerinden çek 4 tane aynı widget'ı kullanma!!!