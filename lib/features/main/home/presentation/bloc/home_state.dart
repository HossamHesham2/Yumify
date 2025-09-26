part of 'home_bloc.dart';

class HomeState extends Equatable {
  final RequestState? recipeRequestState;
  final RequestState? recipeDetailsRequestState;
  final RequestState? favoritesRequestState;
  final Failure? recipeFailure;
  final Failure? recipeDetailsFailure;
  final Failure? favoritesFailure;
  final List<RecipeModel>? listOfRecipeModel;
  final RecipeDetailsModel? recipeDetailsModel;
  final List<RecipeDetailsModel>? favorites;

  const HomeState({
    this.recipeRequestState,
    this.recipeFailure,
    this.listOfRecipeModel,
    this.recipeDetailsRequestState,
    this.recipeDetailsFailure,
    this.recipeDetailsModel,
    this.favorites,
    this.favoritesRequestState,
    this.favoritesFailure,
  });

  factory HomeState.initial() {
    return const HomeState(
      recipeRequestState: RequestState.initial,
      recipeDetailsRequestState: RequestState.initial,
      favoritesRequestState: RequestState.initial,
      recipeDetailsFailure: null,
      recipeFailure: null,
      favoritesFailure: null,
      listOfRecipeModel: null,
      recipeDetailsModel: null,
      favorites: [],
    );
  }

  HomeState copyWith({
    RequestState? recipeRequestState,
    Failure? recipeFailure,
    List<RecipeModel>? listOfRecipeModel,
    RequestState? recipeDetailsRequestState,
    Failure? recipeDetailsFailure,
    RecipeDetailsModel? recipeDetailsModel,
    List<RecipeDetailsModel>? favorites,
    RequestState? favoritesRequestState,
    Failure? favoritesFailure,
  }) {
    return HomeState(
      recipeRequestState: recipeRequestState ?? this.recipeRequestState,
      recipeFailure: recipeFailure ?? this.recipeFailure,
      listOfRecipeModel: listOfRecipeModel ?? this.listOfRecipeModel,
      recipeDetailsRequestState:
          recipeDetailsRequestState ?? this.recipeDetailsRequestState,
      recipeDetailsModel: recipeDetailsModel ?? this.recipeDetailsModel,
      recipeDetailsFailure: recipeDetailsFailure ?? this.recipeDetailsFailure,
      favorites: favorites ?? this.favorites,
      favoritesRequestState:
          favoritesRequestState ?? this.favoritesRequestState,
      favoritesFailure: favoritesFailure ?? this.favoritesFailure,
    );
  }

  @override
  List<Object?> get props => [
    recipeRequestState,
    recipeFailure,
    listOfRecipeModel,
    recipeDetailsRequestState,
    recipeDetailsModel,
    recipeDetailsFailure,
    favorites,
    favoritesRequestState,
    favoritesFailure,
  ];
}

enum RequestState { initial, loading, error, success }
