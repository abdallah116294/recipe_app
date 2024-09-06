part of 'favorite_cubit.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}
class  GetFavoriteLoading extends FavoriteState{}
class  GetFavoriteSuccess extends FavoriteState{
  List<Map<String, dynamic>> favorites;
  GetFavoriteSuccess(this.favorites);
}
class  GetFavoriteFailure extends FavoriteState{}
class  DeleteFavoriteLoading extends FavoriteState{}
class  DeleteFavoriteSuccess extends FavoriteState{
  int response;
  DeleteFavoriteSuccess(this.response);
}
class  DeleteFavoriteFailure extends FavoriteState{}