import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/base/size/model/screensize_model.dart';
import 'package:recipe/core/constant/color/color_const.dart';
import 'package:recipe/product/widget/popup/recipe_detail_popup.dart';

// ignore: must_be_immutable
class RecipeDetailView extends StatefulWidget {
  RecipeDetailView({
    super.key,
    required this.id,
    required this.name,
    required this.time,
    required this.type,
    required this.description,
  });
  int id;
  String? name;
  double? time;
  String? type;
  String? description;
  @override
  State<RecipeDetailView> createState() => _RecipeDetailViewState();
}

class _RecipeDetailViewState extends State<RecipeDetailView> {
  Radius ellipticalRadius = const Radius.elliptical(20, 150);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RecipeColor.lightPink,
      body: Center(
        child: SizedBox(
          height: Provider.of<ScreenSize>(context).getHeight(context) / 1.1,
          width: Provider.of<ScreenSize>(context).getWidth(context) / 1.1,
          child: Card(
            color: RecipeColor.white,
            shadowColor: RecipeColor.myPink,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: ellipticalRadius,
                topRight: ellipticalRadius,
                bottomLeft: ellipticalRadius,
                bottomRight: ellipticalRadius,
              ),
              side: BorderSide(
                color: RecipeColor.myPink,
                width: 1.5,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: RecipeDetailPopUp(id: widget.id),
                  ),
                ),
                Text(
                  widget.name ?? " ",
                  style: Theme.of(context).textTheme.labelSmall?.merge(
                        nameRecipeCard(),
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.timer,
                      color: RecipeColor.myPink,
                    ),
                    Text(
                      widget.time!.toString(),
                      style: Theme.of(context).textTheme.displaySmall?.merge(
                            timeRecipeCard(),
                          ),
                    ),
                  ],
                ),
                Text(
                  widget.type ?? "",
                  style: Theme.of(context).textTheme.bodySmall?.merge(
                        typeOfMealRecipeCard(),
                      ),
                ),
                Text(
                  widget.description ?? "",
                  style: Theme.of(context).textTheme.bodySmall?.merge(
                        typeOfMealRecipeCard(),
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle typeOfMealRecipeCard() {
    return TextStyle(
      fontSize: 13.0,
      color: RecipeColor.myPink,
      overflow: TextOverflow.visible,
    );
  }

  TextStyle timeRecipeCard() {
    return TextStyle(
      color: RecipeColor.black,
      fontSize: 15.0,
    );
  }

  TextStyle nameRecipeCard() {
    return TextStyle(
      fontSize: 25.0,
      color: RecipeColor.myPink,
    );
  }
}
