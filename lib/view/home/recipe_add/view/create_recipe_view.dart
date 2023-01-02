import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/base/size/model/screensize_model.dart';
import 'package:recipe/core/constant/color/color_const.dart';
import 'package:recipe/core/widget/button/customized_button.dart';
import 'package:recipe/product/widget/card/ingredient_card/view/ingredient_card_view.dart';
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: SizedBox(
                  height: 60,
                  width: 400,
                  child: TextField(
                    controller: nameTextEditingController,
                    decoration: textFieldDecoration("Name:", FontAwesomeIcons.pen),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: SizedBox(
                  height: 60,
                  width: 400,
                  child: TextField(
                    controller: timeTextEditingController,
                    decoration: textFieldDecoration("Time:", FontAwesomeIcons.clock),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: SizedBox(
                  height: 60,
                  width: 400,
                  child: TextField(
                    controller: typeTextEditingController,
                    decoration: textFieldDecoration("Type:", FontAwesomeIcons.typo3),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: SizedBox(
                  height: 60,
                  width: 400,
                  child: TextField(
                    controller: descriptionTextEditingController,
                    decoration: textFieldDecoration("Description:", FontAwesomeIcons.book),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: GeneralButton(
                  onPressedFun: () {},
                  buttonWidget: const Text("ADD INGREDIENT"),
                  heightButton: 50,
                  widthButton: 150,
                ),
              ),
              SizedBox(
                height: 400,
                width: Provider.of<ScreenSize>(context).getWidth(context),
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: IngredientCard(
                        ingredientTextStyle: textFieldHintText(),
                        textFieldDecoration: textFieldDecoration(
                          "Ingredient:",
                          FontAwesomeIcons.kitchenSet,
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
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
