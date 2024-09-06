import 'package:flutter/material.dart';
import 'package:recipe_app/Features/recpie/data/model/recpi_model.dart';
import 'package:recipe_app/config/local_db/local_db.dart';
import 'package:recipe_app/core/network/api_constant.dart';
import 'package:recipe_app/core/network/api_consumer.dart';

class RecipeRepo {
  final ApiConsumer apiConsumer;
  SqlDb sqlDb = SqlDb();
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

  Future<void> addRecipeToFavorite({
    required int userId,
    required String recipeId,
    required String recipeName,
    required String recipeImage,
    required String recipeHeadline,
  }) async {
    try {
      final response = await sqlDb.addFavorite(
          userId, recipeId, recipeName, recipeImage, recipeHeadline);
     debugPrint("Repo output$response");     
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
