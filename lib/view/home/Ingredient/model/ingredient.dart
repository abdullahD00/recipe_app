import 'package:flutter/widgets.dart';

class Ingredient extends ChangeNotifier {
  int? id;
  String? name;
  double? amount;

  Ingredient({this.id, this.name, this.amount});

  Ingredient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['amount'] = amount;
    return data;
  }
}
