import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:recipe/product/enum/recipe_service_enum.dart';
import 'package:recipe/view/home/recipe/model/recipe.dart';
import 'package:recipe/view/home/recipe/service/recipe_service.dart';

mixin RecipeServiceFuncMix implements IRecipeService {
  var myDio = Dio(BaseOptions(baseUrl: 'localhost:8080/api/'));

  List<Recipe>? recipeList = [];
  @override
  Future<List<Recipe>?> findAllFood() async {
    try {
      final response = await myDio.get(RecipeServicePaths.food.name);

      final datas = response.data;
      if (datas is List) {
        return datas.map((e) => Recipe.fromJson(e)).toList();
      }
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }

  @override
  Future<void> addRecipe(Recipe myRecipe) async {
    try {
      var myResponse = await myDio.post(RecipeServicePaths.food.name, data: {
        'id': 1,
        'name': 'makarna',
        'description': 'nice food',
        'time': 15.0,
        'typeOfMeal': 'nice food two',
      });
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
  }

  @override
  Future<void> deleteRecipeById(int id) async {
    try {
      var myResponse = await myDio.delete('${RecipeServicePaths.food.name}/$id');
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
  }

  @override
  Future<void> updateRecipe(Recipe myCurrentRecipe, int id) async {
    try {
      var myResponse = await myDio.put('${RecipeServicePaths.food.name}/$id', data: myCurrentRecipe);
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
  }
}

class _ShowDebug {
  static void showDioError<T>(DioError error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
      print('-----');
    }
  }
}
