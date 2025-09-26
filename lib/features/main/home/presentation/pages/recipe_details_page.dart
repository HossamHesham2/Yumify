import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_generator/core/di/di.dart';
import 'package:recipes_generator/core/models/recipe_details_model.dart';
import 'package:recipes_generator/core/utils/colors_manager.dart';
import 'package:recipes_generator/core/utils/font_manager.dart';
import 'package:recipes_generator/core/utils/poppins_style_manager.dart';
import 'package:recipes_generator/features/main/home/presentation/bloc/home_bloc.dart';
import 'package:recipes_generator/features/main/home/presentation/widgets/custom_app_bar_recipe_details.dart';
import 'package:recipes_generator/features/main/home/presentation/widgets/recipe_details_card.dart';

class RecipeDetailsPage extends StatefulWidget {
  const RecipeDetailsPage({super.key});

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  bool isFave = false;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final id = args['id'] ?? 0;
    print("Id --> $id");
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()
        ..add(LoadRecipeDetailsEvent(id: id))
        ..add(LoadFavoritesEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.recipeDetailsRequestState == RequestState.loading) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(color: ColorsManager.orangeF7),
              ),
            );
          } else if (state.recipeDetailsRequestState == RequestState.error) {
            return Scaffold(
              body: Center(
                child: Text(
                  "An error occurred while loading the data",
                  style: PoppinsStyleManager.semiBold(
                    fontSize: FontSizeManager.s18,
                    color: ColorsManager.orangeEf,
                  ),
                ),
              ),
            );
          }
          if (state.recipeDetailsRequestState == RequestState.loading) {
            return Scaffold();
          }
          return Scaffold(
            body: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl:
                      (state.recipeDetailsModel?.image?.isNotEmpty ?? false)
                      ? state.recipeDetailsModel!.image!
                      : "assets/images/placeholder.png",
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 320.h,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.orangeF7,
                    ),
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    "assets/images/placeholder.png",
                    fit: BoxFit.cover,
                  ),
                ),

                SafeArea(
                  child: Column(
                    children: [
                      CustomAppBarRecipeDetails(
                        recipeDetailsModel:
                            state.recipeDetailsModel ?? RecipeDetailsModel(),
                      ),
                      SizedBox(height: 150.h),
                      RecipeDetailsCard(
                        recipeDetailsModel: state.recipeDetailsModel,
                      ),
                    ],
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
