import 'package:recipe_app/config/local_db/local_db.dart';

class LoginRepo {
  SqlDb sqlDb = SqlDb();
  Future<void>createUser({required String username , required String password })async{
    try{
      await sqlDb.createUser(username, password);
    }catch(e){
      throw Exception(e.toString());
    }
  }
    Future<void>loginUser({required String username , required String password })async{
    try{
      await sqlDb.loginUser(username, password);
    }catch(e){
      throw Exception(e.toString());
    }
  }
}