import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/base/size/model/screensize_model.dart';
import 'package:recipe/core/constant/color/color_const.dart';
import 'package:recipe/core/widget/button/customized_button.dart';
import 'package:recipe/product/widget/card/ingredient_card/viewmodel/ingredient_card_viewmodel.dart';

// ignore: must_be_immutable
class IngredientCard extends StatefulWidget {
  IngredientCard({
    super.key,
    this.cardHeight,
    this.cardWight,
    this.myController,
    this.textFieldDecoration,
    this.ingredientTextStyle,
    this.saveIngredientFunc,
  });
  double? cardHeight;
  double? cardWight;

  TextEditingController? myController;
  VoidCallback? saveIngredientFunc; //ingredienti savelemek
  InputDecoration? textFieldDecoration;
  TextStyle? ingredientTextStyle;
  @override
  State<IngredientCard> createState() => _IngredientCardState();
}

double? counter = 0;

class _IngredientCardState extends IngredientCardViewModel {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.cardHeight ?? 133,
      width: widget.cardWight ?? Provider.of<ScreenSize>(context).getWidth(context),
      child: Card(
        color: RecipeColor.lightPink,
        elevation: 30.0,
        shadowColor: RecipeColor.black,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50,
                  width: 200,
                  child: TextField(
                    decoration: widget.textFieldDecoration,
                    controller: widget.myController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: GeneralButton(
                    onPressedFun: () {
                      setState(() {
                        counter = counter! + 0.5;
                      });
                    },
                    buttonWidget: const Text("+"),
                    heightButton: 35,
                    widthButton: 35,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    counter.toString(),
                    style: widget.ingredientTextStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: GeneralButton(
                    onPressedFun: () {
                      setState(() {
                        counter = counter! - 0.5;
                      });
                    },
                    buttonWidget: const Text("-"),
                    heightButton: 35,
                    widthButton: 35,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: GeneralButton(
                    onPressedFun: () {
                      //delete ingredient
                    },
                    buttonWidget: const Text("DELETE"),
                    heightButton: 30,
                    widthButton: 90,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
