import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:recipe/product/enum/recipe_service_enum.dart';
import 'package:recipe/view/home/recipe/model/recipe.dart';
import 'package:recipe/view/home/recipe/service/recipe_service.dart';
import 'package:recipe/view/home/recipe/view/recipe_view.dart';

abstract class RecipeViewModel extends State<RecipeView> implements IRecipeService {
  var myDio = Dio();
  RecipeViewModel() : myDio = Dio(BaseOptions(baseUrl: 'URL'));
  List<Recipe>? recipeList;
  @override
  void initState() {
    super.initState();
    // ignore: unrelated_type_equality_checks
    recipeList != findAllFood();
    findAllFood();
  }

  @override
  Future<List<Recipe>?> findAllFood() async {
    try {
      final response = await myDio.get(RecipeServicePaths.recipe.name);
      if (response.statusCode == HttpStatus.ok) {
        final datas = response.data;
        if (datas is List) {
          return datas.map((e) => Recipe.fromJson(e)).toList();
        }
      } else {}
    } on DioError catch (exception) {
      _ShowDebug.showDioError(exception, this);
    }
    return null;
  }

  @override
  Future<bool> addRecipe(Recipe myRecipe) async {
    try {
      final response = await myDio.post(RecipeServicePaths.recipe.name, data: myRecipe);
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return false;
  }

  @override
  Future<bool> deleteRecipeById(int id) async {
    try {
      final response = await myDio.delete('${RecipeServicePaths.recipe.name}/$id');
      return response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return false;
  }

  @override
  Future<bool> updateRecipe(Recipe myCurrentRecipe, int id) async {
    try {
      final response = await myDio.put('${RecipeServicePaths.recipe.name}/$id', data: myCurrentRecipe);
      response.statusCode == HttpStatus.ok;
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
    return false;
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
