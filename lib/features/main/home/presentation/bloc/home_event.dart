part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class FindRecipe extends HomeEvent {
  final List<String> ingredients;

  const FindRecipe({required this.ingredients});

  @override
  // TODO: implement props
  List<Object?> get props => [ingredients];
}

class LoadRecipeDetailsEvent extends HomeEvent {
  final int id;

  const LoadRecipeDetailsEvent({required this.id});

  @override
   List<Object?> get props => [id];
}

class SaveRecipeEvent extends HomeEvent {
  final RecipeDetailsModel recipeDetailsModel;

  const SaveRecipeEvent({required this.recipeDetailsModel});

  @override
  List<Object?> get props => [recipeDetailsModel];
}

class RemoveRecipeEvent extends HomeEvent {
  final int recipeId;

  const RemoveRecipeEvent(this.recipeId);

  @override
  List<Object?> get props => [recipeId];
}

class LoadSavedRecipesEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
class LoadFavoritesEvent extends HomeEvent {
  @override
  List<Object?> get props => throw [];
}