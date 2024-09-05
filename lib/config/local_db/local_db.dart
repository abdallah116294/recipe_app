import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class SqlDb {

  static Database? _db ; 
  
  Future<Database?> get db async {
      if (_db == null){
        _db  = await intialDb() ;
        return _db ;  
      }else {
        return _db ; 
      }
  }


intialDb() async {
  String databasepath = await getDatabasesPath() ; 
  String path = join(databasepath , 'recipe_app.db') ;   
  Database mydb = await openDatabase(path , onCreate: _onCreate , version: 3  , onUpgrade:_onUpgrade ) ;  
  return mydb ; 
}

_onUpgrade(Database db , int oldversion , int newversion ) {


 print("onUpgrade =====================================") ; 
  
}

_onCreate(Database db , int version) async {

   // Create users table
    await db.execute('''
      CREATE TABLE "users" (
        "id" INTEGER PRIMARY KEY AUTOINCREMENT,
        "username" TEXT NOT NULL UNIQUE,
        "password" TEXT NOT NULL
      )
    ''');

    // Create favorites table
await db.execute('''
  CREATE TABLE "recipe_favorite" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "userId" INTEGER NOT NULL,
    "recipeId" INTEGER NOT NULL,
    "recipeName" TEXT NOT NULL,
    "recipeImage" TEXT NOT NULL,
    "recipeHeadline" TEXT NOT NULL,
    FOREIGN KEY (userId) REFERENCES users(id),
    FOREIGN KEY (recipeId) REFERENCES recipes(id)  -- Assuming there's a recipes table
  )
''');

 print(" onCreate =====================================") ; 

}
  Future<int> createUser(String username, String password) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert('''
      INSERT INTO users (username, password) VALUES (?, ?)
    ''', [username, password]);
    return response;
  }

  Future<Map<String, dynamic>?> loginUser(String username, String password) async {
    Database? mydb = await db;
    List<Map<String, dynamic>> result = await mydb!.rawQuery('''
      SELECT * FROM users WHERE username = ? AND password = ?
    ''', [username, password]);

    if (result.isNotEmpty) {
      return result.first;
    } else {
      return null; // Invalid credentials
    }
  }
  // Favorites Functions
  Future<int> addFavorite(int userId, int recipeId, String recipeName, String recipeImage, String recipeHeadline) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert('''
      INSERT INTO recipe_favorite (userId, recipeId, recipeName, recipeImage, recipeHeadline)
      VALUES (?, ?, ?, ?, ?)
    ''', [userId, recipeId, recipeName, recipeImage, recipeHeadline]);
    return response;
  }

  Future<List<Map<String, dynamic>>> getUserFavorites(int userId) async {
    Database? mydb = await db;
    List<Map<String, dynamic>> response = await mydb!.rawQuery('''
      SELECT recipe_favorite.* FROM recipe_favorite
      WHERE recipe_favorite.userId = ?
    ''', [userId]);
    return response;
  }
readData(String sql) async {
  Database? mydb = await db ; 
  List<Map> response = await  mydb!.rawQuery(sql);
  return response ; 
}
insertData(String sql) async {
  Database? mydb = await db ; 
  int  response = await  mydb!.rawInsert(sql);
  return response ; 
}
updateData(String sql) async {
  Database? mydb = await db ; 
  int  response = await  mydb!.rawUpdate(sql);
  return response ; 
}
deleteData(String sql) async {
  Database? mydb = await db ; 
  int  response = await  mydb!.rawDelete(sql);
  return response ; 
}

}