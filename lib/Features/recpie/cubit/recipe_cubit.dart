import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/Features/recpie/data/model/recpi_model.dart';
import 'package:recipe_app/Features/recpie/data/repo/recipe_repo.dart';

part 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit(this.recipeRepo) : super(RecipeInitial());
  RecipeRepo recipeRepo;
  Future<void> getRecipe() async {
    emit(GetRecipeLoading());
    try {
      final recipes = await recipeRepo.getRecipes();
      emit(GetRecipeSuccess(recipes));
    } catch (e) {
      emit(GetRecipeFailure());
    }
  }

  Future<void> addRecipeToFavorite({
    required int userId,
    required String recipeId,
    required String recipeName,
    required String recipeImage,
    required String recipeHeadline,
  }) async {
    emit(AddRecipeToFavoriteLoading());
    try {
      await recipeRepo.addRecipeToFavorite(
        userId: userId,
        recipeId: recipeId,
        recipeName: recipeName,
        recipeImage: recipeImage,
        recipeHeadline: recipeHeadline,
      );
      emit(AddRecipeToFavoriteSuccess());
    } catch (e) {
      emit(AddRecipeToFavoriteFailure());
    }
  }
}

