class Recipe {
  int? id;
  String? name;
  String? description;
  int? time;
  String? typeOfMeal;

  Recipe({this.id, this.name, this.description, this.time, this.typeOfMeal});

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    time = json['time'];
    typeOfMeal = json['typeOfMeal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['time'] = time;
    data['typeOfMeal'] = typeOfMeal;
    return data;
  }
}
