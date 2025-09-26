import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_generator/core/models/recipe_details_model.dart';
import 'package:recipes_generator/core/utils/colors_manager.dart';
import 'package:recipes_generator/features/main/home/presentation/bloc/home_bloc.dart';

class CustomAppBarRecipeDetails extends StatelessWidget {
  final RecipeDetailsModel recipeDetailsModel;

  const CustomAppBarRecipeDetails({
    super.key,
    required this.recipeDetailsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back button
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorsManager.grey4B.withValues(alpha: 0.4),
                    spreadRadius: 1.r,
                    blurRadius: 5.r,
                  ),
                ],
                color: ColorsManager.white.withValues(alpha: 0.9),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.arrow_back, size: 25.sp),
            ),
          ),

          // Favorite button
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              final isFave = state.favorites?.any((r) => r.id == recipeDetailsModel.id) ?? false;

              return GestureDetector(
                onTap: () {
                  if (isFave) {
                    context.read<HomeBloc>().add(RemoveRecipeEvent(recipeDetailsModel.id!.toInt()));
                  } else {
                    context.read<HomeBloc>().add(SaveRecipeEvent(recipeDetailsModel: recipeDetailsModel));
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ColorsManager.grey4B.withValues(alpha: 0.4),
                        spreadRadius: 1.r,
                        blurRadius: 3.r,
                      ),
                    ],
                    color: ColorsManager.white.withValues(alpha: 0.9),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isFave ? Icons.favorite : Icons.favorite_border,
                    size: 25.sp,
                    color: isFave ? ColorsManager.orangeF7 : ColorsManager.grey4B,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
