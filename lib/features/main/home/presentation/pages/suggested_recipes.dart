import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_generator/config/routes/name_of_routes.dart';
import 'package:recipes_generator/core/di/di.dart';
import 'package:recipes_generator/core/utils/colors_manager.dart';
import 'package:recipes_generator/core/utils/font_manager.dart';
import 'package:recipes_generator/core/utils/poppins_style_manager.dart';
import 'package:recipes_generator/features/main/home/presentation/bloc/home_bloc.dart';
import 'package:recipes_generator/features/main/home/presentation/widgets/custom_suggested_app_bar.dart';
import 'package:recipes_generator/features/main/home/presentation/widgets/recipe_shimmer_card.dart';

class SuggestedRecipesPage extends StatelessWidget {
  const SuggestedRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final ingredients = args?['ingredientsList'] as List<String>? ?? [];
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()
        ..add(FindRecipe(ingredients: ingredients))
        ..add(LoadFavoritesEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.recipeRequestState == RequestState.error) {
            return Scaffold(
              body: Column(
                children: [
                  CustomSuggestedAppBar(),

                  Expanded(
                    child: Center(
                      child: Text(
                        state.recipeFailure?.message ?? "Something went wrong",
                        style: PoppinsStyleManager.bold(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          final listOfRecipeModel = state.listOfRecipeModel;
          if (state.recipeRequestState == RequestState.loading) {
            return Scaffold(
              body: Column(
                children: [
                  CustomSuggestedAppBar(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GridView.builder(
                        itemCount: listOfRecipeModel?.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16.h,
                          crossAxisSpacing: 16.w,
                        ),
                        itemBuilder: (context, index) =>
                            const RecipeShimmerCard(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          if (listOfRecipeModel == null || listOfRecipeModel.isEmpty) {
            return Scaffold(
              body: Column(
                children: [
                  CustomSuggestedAppBar(),
                  Expanded(
                    child: Center(
                      child: Text(
                        "No recipes found for these ingredients",
                        style: PoppinsStyleManager.bold(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Scaffold(
            body: Column(
              children: [
                CustomSuggestedAppBar(),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          final recipeId = listOfRecipeModel[index].id;

                          context.read<HomeBloc>().add(
                            LoadRecipeDetailsEvent(id: recipeId.toInt()),
                          );

                          // نتأكد كمان من الفيفورت من SQLite
                          context.read<HomeBloc>().add(LoadFavoritesEvent());

                          // بعد ما ندي الأحداث، نروح للصفحة
                          Navigator.pushNamed(
                            context,
                            NameOfRoutes.recipeDetails,
                            arguments: {"id": recipeId},
                          );
                        },

                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: ColorsManager.white,
                            boxShadow: [
                              BoxShadow(
                                color: ColorsManager.black1F,
                                blurRadius: 6.r,
                                spreadRadius: 0.2,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 10.h,
                            children: [
                              Expanded(
                                child: Center(
                                  child: CachedNetworkImage(
                                    imageUrl: listOfRecipeModel[index].image,
                                    width: 136.w,
                                    height: 96.h,
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(
                                        color: ColorsManager.orangeF7,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Center(
                                          child: Icon(
                                            Icons.broken_image_outlined,
                                            color: ColorsManager.orangeF7,
                                            fontWeight:
                                                FontWeightManager.semiBold,
                                            size: 45.sp,
                                          ),
                                        ),
                                  ),
                                ),
                              ),
                              Text(
                                listOfRecipeModel[index].title,
                                style: PoppinsStyleManager.bold(),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    spacing: 3.w,
                                    children: [
                                      Text("Likes :"),

                                      Text(
                                        listOfRecipeModel[index].likes
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons.favorite,
                                    size: 15.sp,
                                    color: ColorsManager.orangeF7,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      itemCount: listOfRecipeModel.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 16.w,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
