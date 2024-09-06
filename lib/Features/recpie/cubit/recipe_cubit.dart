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
}
