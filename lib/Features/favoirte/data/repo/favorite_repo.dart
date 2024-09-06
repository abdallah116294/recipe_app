import 'package:recipe_app/config/local_db/local_db.dart';

class FavoriteRepo {
  SqlDb sqlDb = SqlDb();
  Future<List<Map<String, dynamic>>> getFavorite({required int userID}) async {
    try {
      final response = await sqlDb.getUserFavorites(userID);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<int?> deleteFromFavorite(
      {required int userid, required String recipeId}) async {
    try {
      final response = await sqlDb.deleteFavorite(userid, recipeId);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
