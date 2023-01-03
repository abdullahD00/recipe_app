import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/base/size/model/screensize_model.dart';
import 'package:recipe/core/constant/color/color_const.dart';
import 'package:recipe/core/widget/button/customized_button.dart';
import 'package:recipe/product/widget/card/ingredient_card/view/ingredient_card_view.dart';
import 'package:recipe/view/home/recipe/model/recipe.dart';
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
            clearTextEditingRecipeValue();
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
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
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
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
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
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
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
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: descriptionTextEditingController,
                    decoration: textFieldDecoration("Description:", FontAwesomeIcons.book),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: GeneralButton(
                  onPressedFun: () {
                    addIngredientToList();
                  },
                  buttonWidget: const Text("ADD INGREDIENT"),
                  heightButton: 50,
                  widthButton: 150,
                ),
              ),
              SizedBox(
                height: 400,
                width: Provider.of<ScreenSize>(context).getWidth(context),
                child: ListView.builder(
                  itemCount: myIngredientList!.length,
                  itemBuilder: (context, index) {
                    addTextEditingItemToList(index);
                    return Slidable(
                      endActionPane: ActionPane(
                        motion: Container(
                          height: 400,
                          width: Provider.of<ScreenSize>(context).getWidth(context),
                          color: RecipeColor.lightPink,
                          child: IconButton(
                            onPressed: () {},
                            icon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.delete),
                              color: RecipeColor.darkPink,
                              iconSize: 40,
                            ),
                          ),
                        ),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              deleteIngredient(index);
                            },
                            backgroundColor: RecipeColor.myPink,
                            foregroundColor: RecipeColor.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: IngredientCard(
                          myController: myTextEditingList[index],
                          ingredientTextStyle: textFieldHintText(),
                          textFieldDecoration: textFieldDecoration(
                            "Ingredient:",
                            FontAwesomeIcons.kitchenSet,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GeneralButton(
                  onPressedFun: () {
                    addRecipe(
                      Recipe(
                        name: nameTextEditingController.text,
                        time: double.parse(timeTextEditingController.text),
                        typeOfMeal: typeTextEditingController.text,
                        description: descriptionTextEditingController.text,
                        ingredients: myIngredientList,
                      ),
                    );
                  },
                  buttonWidget: const Text("ADD"),
                  heightButton: 50,
                  widthButton: 150,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
