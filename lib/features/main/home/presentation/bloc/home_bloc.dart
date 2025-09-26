import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:recipes_generator/core/database/cache/sqflite_db.dart';
import 'package:recipes_generator/core/errors/failures.dart';
import 'package:recipes_generator/core/models/recipe_details_model.dart';
import 'package:recipes_generator/core/models/recipe_model.dart';
import 'package:recipes_generator/features/main/home/data/repositories/recipe_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  RecipeRepository recipeRepository;

  HomeBloc(this.recipeRepository) : super(HomeState.initial()) {
    on<FindRecipe>((event, emit) async {
      print("FindRecipe Event Triggered with: ${event.ingredients}");
      emit(state.copyWith(recipeRequestState: RequestState.loading));

      final result = await recipeRepository.fetchRecipes(event.ingredients);

      result.fold(
        (l) {
          print("Error: ${l.message}");
          emit(
            state.copyWith(
              recipeRequestState: RequestState.error,
              recipeFailure: l,
            ),
          );
        },
        (r) {
          print("Fetched recipes: $r");
          emit(
            state.copyWith(
              recipeRequestState: RequestState.success,
              listOfRecipeModel: r,
            ),
          );
        },
      );
    });
    on<LoadRecipeDetailsEvent>((event, emit) async {
      emit(state.copyWith(recipeDetailsRequestState: RequestState.loading));

      final result = await recipeRepository.fetchRecipeDetails(event.id);

      result.fold(
            (l) {
          emit(
            state.copyWith(
              recipeDetailsRequestState: RequestState.error,
              recipeDetailsFailure: l,
            ),
          );
        },
            (r) {
          emit(
            state.copyWith(
              recipeDetailsRequestState: RequestState.success,
              recipeDetailsModel: r,
            ),
          );
        },
      );
    });

    on<SaveRecipeEvent>((event, emit) async {
      final db = SqfliteDb();
      await db.insertRecipe(event.recipeDetailsModel);

      final updated = List<RecipeDetailsModel>.from(state.favorites ?? []);
      final exists = updated.any((r) => r.id == event.recipeDetailsModel.id);

      if (!exists) {
        updated.add(event.recipeDetailsModel);
      }

      emit(
        state.copyWith(
          favorites: updated,
          favoritesRequestState: RequestState.success,
        ),
      );
    });

    on<RemoveRecipeEvent>((event, emit) async {
      final db = SqfliteDb();
      await db.deleteRecipe(event.recipeId);
      final updated = List<RecipeDetailsModel>.from(state.favorites ?? []);
      updated.removeWhere((r) => r.id == event.recipeId);

      emit(state.copyWith(favorites: updated));
    });
    on<LoadFavoritesEvent>((event, emit) async {
      final favorites = await recipeRepository.getAllFavorites(); // من SQLite
      emit(state.copyWith(favorites: favorites));
    });
    on<LoadSavedRecipesEvent>((event, emit) async {
      emit(state.copyWith(favoritesRequestState: RequestState.loading));
      final db = SqfliteDb();
      final recipes = await db.getAllRecipes();

      emit(state.copyWith(favorites: recipes));
    });
  }
}
