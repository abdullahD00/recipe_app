import 'package:flutter/cupertino.dart';
import 'package:recipe/product/widget/card/ingredient_card/view/ingredient_card_view.dart';

abstract class IngredientCardViewModel extends State<IngredientCard> {
  void upCounter(double counter) {
    setState(() {
      counter = counter + 0.5;
    });
  }

  void downCounter(double counter) {
    setState(() {
      counter = counter - 0.5;
    });
  }
}
