import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:recipes_generator/core/database/api/app_interceptor.dart';
import 'package:recipes_generator/core/models/recipe_details_model.dart';
import 'package:recipes_generator/core/models/recipe_model.dart';
import 'package:retrofit/retrofit.dart';

part 'generator_client.g.dart';

@RestApi(baseUrl: 'https://api.spoonacular.com')
abstract class GeneratorClient {
  factory GeneratorClient(Dio dio, {String? baseUrl}) = _GeneratorClient;

  @GET('/recipes/findByIngredients')
  Future<List<RecipeModel>> getRecipes(
    @Query("ingredients") String ingredients,
    @Query("number") int number,
  );

  @GET('/recipes/{id}/information')
  Future<RecipeDetailsModel> getRecipeDetails(@Path('id') int id);
}

@module
abstract class DioModule {
  @lazySingleton
  Dio dio() => Dio()
    ..interceptors.add(PrettyDioLogger(requestBody: true, responseBody: true))
    ..interceptors.add(AppInterceptor());

  @lazySingleton
  GeneratorClient generatorClient(Dio dio) =>
      GeneratorClient(dio, baseUrl: 'https://api.spoonacular.com');
}
