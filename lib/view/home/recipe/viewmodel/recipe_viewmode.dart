import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:recipe/product/enum/recipe_service_enum.dart';
import 'package:recipe/view/home/recipe/model/recipe.dart';
import 'package:recipe/view/home/recipe/service/recipe_service.dart';
import 'package:recipe/view/home/recipe/view/recipe_view.dart';

abstract class RecipeViewModel extends State<RecipeView> implements IRecipeService {
  var myDio = Dio();
  RecipeViewModel() : myDio = Dio(BaseOptions(baseUrl: 'https://localhost:8080/api/food'));
  List<Recipe>? recipeList;
  @override
  void initState() {
    findAllFood().then((value) {
      setState(() {
        recipeList != value;
      });
    });
    super.initState();
  }

  @override
  Future<List<Recipe>?> findAllFood() async {
    try {
      final response = await myDio.get(RecipeServicePaths.recipe.name);

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
      final response = await myDio.post(RecipeServicePaths.recipe.name, data: myRecipe);
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
  }

  @override
  Future<void> deleteRecipeById(int id) async {
    try {
      final response = await myDio.delete('${RecipeServicePaths.recipe.name}/$id');
    } on DioError catch (error) {
      _ShowDebug.showDioError(error, this);
    }
  }

  @override
  Future<void> updateRecipe(Recipe myCurrentRecipe, int id) async {
    try {
      final response = await myDio.put('${RecipeServicePaths.recipe.name}/$id', data: myCurrentRecipe);
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
