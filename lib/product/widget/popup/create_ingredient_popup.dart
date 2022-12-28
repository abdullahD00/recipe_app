import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/base/size/model/screensize_model.dart';
import 'package:recipe/core/constant/color/color_const.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:recipe/core/widget/button/customized_button.dart';
import 'package:recipe/core/widget/textfield/gradient_textfield.dart';
import 'package:recipe/product/widget/popup/create_recipe_popup.dart';

class CreateIngredientPopUp extends StatefulWidget {
  const CreateIngredientPopUp({super.key});

  @override
  State<CreateIngredientPopUp> createState() => _CreateIngredientPopUpState();
}

int currentValue = 0;

List<int> dropDownItemList = <int>[1, 2, 3, 4, 5];
List<TextEditingController> textEditingList = [TextEditingController()];
List<int> dropDownAmountList = [];
//4 seçersek 5 tane ekliyor
var tec = TextEditingController();
void addItemToList(int index) {
  for (var i = 0; i < index; i++) {
    textEditingList.add(TextEditingController());
    dropDownAmountList.add(0);
  }
}

void clearAllList() {
  dropDownAmountList.clear();
  textEditingList.clear();
}

class _CreateIngredientPopUpState extends State<CreateIngredientPopUp> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: RecipeColor.lightPink,
      title: Column(
        children: [
          Center(
            child: Text(
              "INGREDIENT DETAIL",
              style: Theme.of(context).textTheme.displayLarge?.merge(
                    createRecipPopUpTitle(),
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
            child: Text(
              "How many ingredients are in your meal?",
              style: Theme.of(context).textTheme.bodyMedium?.merge(
                    TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w300,
                      color: RecipeColor.myPink,
                    ),
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: NumberPicker(
              value: currentValue,
              selectedTextStyle: TextStyle(
                color: RecipeColor.darkPink,
                fontSize: 28.0,
                fontWeight: FontWeight.w500,
              ),
              axis: Axis.horizontal,
              minValue: 0,
              maxValue: 20,
              onChanged: (value) {
                setState(() {
                  currentValue = value;
                });
              },
            ),
          ),
        ],
      ),
      content: SizedBox(
        height: Provider.of<ScreenSize>(context).getHeight(context) / 2,
        width: Provider.of<ScreenSize>(context).getWidth(context),
        child: ListView.builder(
          itemCount: currentValue,
          itemBuilder: (context, index) {
            clearAllList();
            addItemToList(currentValue);
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Gradienttextfield(
                    height: Provider.of<ScreenSize>(context).getHeight(context) / 13,
                    width: Provider.of<ScreenSize>(context).getWidth(context) / 2.5,
                    colors: [
                      RecipeColor.lightPink,
                      RecipeColor.myPink,
                      RecipeColor.darkPink,
                    ],
                    inputType: TextInputType.name,
                    hintText: "INGREDIENT",
                    fontSize: 15,
                    fontColor: RecipeColor.black,
                    controller: textEditingList[index],
                    fontWeight: FontWeight.w400,
                    radius: 5,
                  ),
                  DropdownButton(
                    value: 2,
                    dropdownColor: RecipeColor.lightPink,
                    focusColor: RecipeColor.darkPink,
                    onChanged: (value) {
                      setState(() {
                        dropDownAmountList[index] = value!;
                        print(dropDownAmountList);
                      });
                    },
                    items: dropDownItemList.map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text("$value"),
                      );
                    }).toList(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      actions: [
        Column(
          children: [
            Center(
              child: GeneralButton(
                onPressedFun: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreateRecipePopUp(),
                    ),
                  );
                  print(textEditingList);
                  print(dropDownAmountList);
                },
                buttonWidget: Text(
                  "DONE",
                  style: Theme.of(context).textTheme.button?.merge(
                        buttonTextStyle(),
                      ),
                ),
                heightButton: 50,
                widthButton: 150,
              ),
            )
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
      fontSize: 25,
      fontWeight: FontWeight.w400,
      color: Colors.pink,
    );
  }
}
