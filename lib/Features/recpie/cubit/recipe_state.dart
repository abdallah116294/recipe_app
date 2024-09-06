part of 'recipe_cubit.dart';

sealed class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object> get props => [];
}

final class RecipeInitial extends RecipeState {}
class GetRecipeLoading extends RecipeState{}
class GetRecipeSuccess extends RecipeState{
  final List<RecipeModel> recipes;
  const GetRecipeSuccess(this.recipes);
}
class GetRecipeFailure extends RecipeState{}
class AddRecipeToFavoriteLoading extends RecipeState{}
class AddRecipeToFavoriteSuccess extends RecipeState{
  final int response;
  AddRecipeToFavoriteSuccess({required this.response});
}
class AddRecipeToFavoriteFailure extends RecipeState{}
