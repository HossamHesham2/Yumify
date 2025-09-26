import 'dart:convert';
import 'package:recipes_generator/core/constants/constants_manager.dart';
import 'package:recipes_generator/core/models/recipe_details_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqfliteDb {
  static const tableName = "recipe";
  static Database? _db;

  // Singleton Getter
  Future<Database?> get getDb async {
    if (_db != null && _db!.isOpen) return _db;
    _db = await initialDb();
    return _db;
  }

  // Initialize Database
  Future<Database> initialDb() async {
    String dataBasePath = await getDatabasesPath();
    String fullPath = join(dataBasePath, ConstantsManager.dataBaseName);
    Database myDb = await openDatabase(
      fullPath,
      version: 1,
      onCreate: _onCreate,
    );
    return myDb;
  }

  // Create Table
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableName(
        recipeId INTEGER PRIMARY KEY,
        data TEXT
      )
    ''');
  }

  // Insert Recipe
  Future<int> insertRecipe(RecipeDetailsModel recipe) async {
    Database? db = await getDb;
    String jsonData = jsonEncode(recipe.toJson());
    return await db!.insert(tableName, {
      "recipeId": recipe.id,
      "data": jsonData,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Get One Recipe by recipeId
  Future<RecipeDetailsModel?> getRecipe(int recipeId) async {
    Database? db = await getDb;

    List<Map<String, dynamic>> result = await db!.query(
      tableName,
      where: "recipeId = ?",
      whereArgs: [recipeId],
    );

    if (result.isNotEmpty) {
      Map<String, dynamic> row = result.first;
      return RecipeDetailsModel.fromJson(jsonDecode(row["data"]));
    }
    return null;
  }

  // Get All Recipes
  Future<List<RecipeDetailsModel>> getAllRecipes() async {
    Database? db = await getDb;
    List<Map<String, dynamic>> result = await db!.query(tableName);

    return result
        .map((row) => RecipeDetailsModel.fromJson(jsonDecode(row["data"])))
        .toList();
  }

  // Delete Recipe by recipeId
  Future<int> deleteRecipe(int recipeId) async {
    Database? db = await getDb;
    return await db!.delete(
      tableName,
      where: "recipeId = ?",
      whereArgs: [recipeId],
    );
  }

  // Clear all Recipes
  Future<int> clearAllRecipes() async {
    Database? db = await getDb;
    return await db!.delete(tableName);
  }
}
