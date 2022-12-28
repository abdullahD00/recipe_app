import 'package:recipe/view/home/Ingredient/model/ingredient.dart';

class Recipe {
  int? id;
  String? name;
  String? description;
  double? time;
  String? typeOfMeal;
  List<Ingredient>? ingredients;

  Recipe({this.id, this.name, this.description, this.time, this.typeOfMeal, this.ingredients});

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    time = json['time_required_to_cook'];
    typeOfMeal = json['type_of_meal'];
    if (json['ingredients'] != null) {
      ingredients = <Ingredient>[];
      json['ingredients'].forEach((v) {
        ingredients!.add(Ingredient.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['time'] = time;
    data['type_of_meal'] = typeOfMeal;
    if (ingredients != null) {
      data['ingredients'] = ingredients!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
