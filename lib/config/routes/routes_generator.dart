import 'package:flutter/material.dart';
import 'package:recipes_generator/features/main/favorites/presentation/pages/favorites_page.dart';
import 'package:recipes_generator/features/main/home/presentation/pages/home_page.dart';
import 'package:recipes_generator/features/main/home/presentation/pages/recipe_details_page.dart';
import 'package:recipes_generator/features/main/home/presentation/pages/suggested_recipes.dart';
import 'package:recipes_generator/features/main/main_page.dart';
  import 'name_of_routes.dart';

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case NameOfRoutes.main:
        return MaterialPageRoute(builder: (_) => MainPage());
      case NameOfRoutes.home:
        return MaterialPageRoute(builder: (_) => HomePage());

      case NameOfRoutes.favorites:
        return MaterialPageRoute(builder: (_) => FavoritesPage());

      case NameOfRoutes.recipeDetails:
        return MaterialPageRoute(
          builder: (_) => RecipeDetailsPage(),
          settings: settings,
        );
      case NameOfRoutes.suggestedRecipes:
        return MaterialPageRoute(
          builder: (_) => SuggestedRecipesPage(),
          settings: settings,
        );
      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) =>
          const Scaffold(body: Center(child: Text('No route found'))),
    );
  }
}
