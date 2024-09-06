import 'package:flutter/material.dart';
import 'package:recipe_app/Features/recpie/data/model/recpi_model.dart';
import 'package:recipe_app/core/network/api_constant.dart';
import 'package:recipe_app/core/network/api_consumer.dart';

class RecipeRepo {
  final ApiConsumer apiConsumer;
  RecipeRepo({required this.apiConsumer});
  Future<List<RecipeModel>> getRecipes() async {
    try {
      final response = await apiConsumer.get(ApiConstant.recipe);
      List<dynamic> recipeList = response as List<dynamic>;
      List<RecipeModel> recipes = recipeList
          .map((e) => RecipeModel.fromJson(e as Map<String, dynamic>))
          .toList();

      debugPrint(recipes.toString());
      debugPrint("Repo output$response");
      return recipes;
    } catch (e) {
      debugPrint(e.toString());
      throw Exception(e);
    }
  }
}
