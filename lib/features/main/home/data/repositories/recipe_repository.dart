import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:dartz/dartz.dart';
import 'package:recipes_generator/core/database/cache/sqflite_db.dart';
import 'package:recipes_generator/core/di/di.dart';
import 'package:recipes_generator/core/errors/failures.dart';
import 'package:recipes_generator/core/models/recipe_details_model.dart';
import 'package:recipes_generator/core/models/recipe_model.dart';
import 'package:recipes_generator/core/services/network/generator_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class RecipeRepository {
  RecipeRepository();

  Future<Either<Failure, List<RecipeModel>>> fetchRecipes(
    List<String> ingredients,
  ) async {
    final query = ingredients.join(",");
    try {
      final result = await getIt<GeneratorClient>().getRecipes(query, 5);
      print("Fetched recipes: $result");
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  Future<Either<Failure, RecipeDetailsModel>> fetchRecipeDetails(int id) async {
    try {
      final result = await getIt<GeneratorClient>().getRecipeDetails(id);
      print("Fetched recipe Details : $result");
      return Right(result);
    } catch (e) {
      return Left(GeneralFailure(message: e.toString()));
    }
  }

  Future<List<RecipeDetailsModel>> getAllFavorites() async {
    final db = SqfliteDb();
    return await db.getAllRecipes();
  }
}
