import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:recipe/core/base/size/model/screensize_model.dart';

// ignore: must_be_immutable
class RecipeCard extends StatelessWidget {
  RecipeCard(
      {Key? key, required this.ellipticalRadius, required this.name, required this.time, required this.typeOfMeal})
      : super(key: key);

  Radius ellipticalRadius;
  String name;
  int time;
  String typeOfMeal;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Provider.of<ScreenSize>(context).getHeight(context) / 3,
      width: Provider.of<ScreenSize>(context).getWidth(context) / 2.1,
      child: Card(
        color: Colors.white,
        shadowColor: const Color.fromRGBO(249, 97, 99, 1),
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: ellipticalRadius,
            topRight: ellipticalRadius,
            bottomLeft: ellipticalRadius,
            bottomRight: ellipticalRadius,
          ),
          side: const BorderSide(
            color: Color.fromRGBO(249, 97, 99, 1),
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.labelSmall?.merge(
                    nameRecipeCard(),
                  ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.timer,
                  color: Color.fromRGBO(249, 97, 99, 1),
                ),
                Text(
                  "$time",
                  style: Theme.of(context).textTheme.displaySmall?.merge(
                        timeRecipeCard(),
                      ),
                ),
              ],
            ),
            Text(typeOfMeal,
                style: Theme.of(context).textTheme.bodySmall?.merge(
                      typeOfMealRecipeCard(),
                    )),
          ],
        ),
      ),
    );
  }

  TextStyle typeOfMealRecipeCard() {
    return const TextStyle(
      fontSize: 13.0,
      color: Color.fromRGBO(249, 97, 99, 1),
    );
  }

  TextStyle timeRecipeCard() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 15.0,
    );
  }

  TextStyle nameRecipeCard() {
    return const TextStyle(
      fontSize: 25.0,
      color: Color.fromRGBO(249, 97, 99, 1),
    );
  }
}
