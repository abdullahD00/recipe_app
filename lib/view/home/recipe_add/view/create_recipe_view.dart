import 'package:flutter/material.dart';
import 'package:recipe/core/constant/color/color_const.dart';
import 'package:recipe/view/home/recipe_add/viewmodel/create_recipe_viewmodel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateRecipeView extends StatefulWidget {
  const CreateRecipeView({super.key});

  @override
  State<CreateRecipeView> createState() => _CreateRecipeViewState();
}

class _CreateRecipeViewState extends CreateRecipeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RecipeColor.lightPink,
      appBar: AppBar(
        backgroundColor: RecipeColor.lightPink,
        leading: IconButton(
          onPressed: () {
            goBackPage(context);
            clearRecipeValue();
          },
          icon: Icon(
            Icons.backspace,
            color: RecipeColor.darkPink,
          ),
        ),
        centerTitle: true,
        title: Text(
          "CREATE OWN RECIPE",
          style: Theme.of(context).textTheme.displayLarge?.merge(
                createRecipTitle(),
              ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 60,
              width: 400,
              child: TextField(
                controller: nameTextEditingController,
                decoration: textFieldDecoration("Name:", FontAwesomeIcons.pen),
              ),
            ),
            SizedBox(
              height: 60,
              width: 400,
              child: TextField(
                controller: timeTextEditingController,
                decoration: textFieldDecoration("Time:", FontAwesomeIcons.clock),
              ),
            ),
            SizedBox(
              height: 60,
              width: 400,
              child: TextField(
                controller: typeTextEditingController,
                decoration: textFieldDecoration("Type:", FontAwesomeIcons.typo3),
              ),
            ),
            SizedBox(
              height: 60,
              width: 400,
              child: TextField(
                controller: descriptionTextEditingController,
                decoration: textFieldDecoration("Description:", FontAwesomeIcons.book),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration textFieldDecoration(String labelText, IconData suffixIcon) {
    return InputDecoration(
      labelText: "$labelText:",
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
