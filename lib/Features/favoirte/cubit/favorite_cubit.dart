import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/Features/favoirte/data/repo/favorite_repo.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit({required this.repo}) : super(FavoriteInitial());
  FavoriteRepo repo;
  Future<void> getFavorite({required int userID}) async {
    emit(GetFavoriteLoading());
    try {
      final response = await repo.getFavorite(userID: userID);
      emit(GetFavoriteSuccess(response));
    } catch (e) {
      emit(GetFavoriteFailure());
    }
  }
    Future<void> deleteFromFavorite({required int userID,required String recipeId}) async {
    emit(DeleteFavoriteLoading());
    try {
      final response = await repo.deleteFromFavorite(userid: userID,recipeId:recipeId );
      emit(DeleteFavoriteSuccess(response!));
    } catch (e) {
      emit(DeleteFavoriteFailure());
    }
  }
}
