import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_generator/config/routes/name_of_routes.dart';
import 'package:recipes_generator/core/utils/assets_manager.dart';
import 'package:recipes_generator/core/utils/colors_manager.dart';
import 'package:recipes_generator/core/utils/font_manager.dart';
import 'package:recipes_generator/core/utils/poppins_style_manager.dart';
import 'package:recipes_generator/core/widgets/custom_elevated_button.dart';
import 'package:recipes_generator/core/widgets/custom_snack_bar.dart';
import 'package:recipes_generator/features/main/home/presentation/widgets/custom_home_app_bar.dart';
import 'package:recipes_generator/features/main/home/presentation/widgets/custom_recipe_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> recipes = [];
  final ingredientsController = TextEditingController();

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(),
    child: SingleChildScrollView(
      child: Column(
        children: [
          CustomHomeAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0.h, horizontal: 16.0.w),
            child: Column(
              spacing: 20.h,

              children: [
                CircleAvatar(
                  maxRadius: 60.r,
                  child: Image.asset(AssetsManager.homeImage, width: 200.w),
                ),
                Text(
                  "What's cooking today?",
                  style: PoppinsStyleManager.semiBold(
                    fontSize: FontSizeManager.s20,
                  ),
                ),
                Text(
                  "Tell us what ingredients you have!",
                  style: PoppinsStyleManager.regular(
                    fontSize: FontSizeManager.s16,
                    color: ColorsManager.grey4B,
                  ),
                ),
                TextField(
                  cursorColor: ColorsManager.orangeF7,
                  controller: ingredientsController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorsManager.whiteF3,
                    suffixIcon: Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: ColorsManager.orangeF7,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: IconButton(
                        onPressed: () {
                          if (ingredientsController.text.isNotEmpty) {
                            recipes.add(ingredientsController.text.trim());
                            CustomSnackBar.show(
                              context,
                              message: "Ingredient added successfully",
                              color: ColorsManager.greenAF,
                            );
                          }
                          if (ingredientsController.text.isEmpty) {
                            CustomSnackBar.show(
                              context,
                              message: "Please write your ingredient",
                              color: ColorsManager.orangeEf,
                            );
                          }
                          ingredientsController.clear();

                          setState(() {});
                        },
                        icon: Icon(Icons.add),
                        color: ColorsManager.white,
                      ),
                    ),

                    hint: Text(
                      "Enter ingredients...",
                      style: PoppinsStyleManager.regular(
                        fontSize: FontSizeManager.s16,
                        color: ColorsManager.greyAD,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorsManager.whiteF3),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: ColorsManager.whiteF3),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(color: ColorsManager.whiteF3),
                    ),
                  ),
                ),
                Wrap(
                  spacing: 10.w,
                  runSpacing: 10.h,
                  children: recipes
                      .map(
                        (e) => CustomRecipeItem(
                          nameOfRecipe: e,
                          onTap: () {
                            recipes.remove(e);
                            setState(() {});
                          },
                        ),
                      )
                      .toList(),
                ),
                CustomElevatedButton(
                  text: "Find Recipes",
                  image: AssetsManager.mealImage,
                  onTap: () => Navigator.pushNamed(
                    context,
                    NameOfRoutes.suggestedRecipes,
                    arguments: {"ingredientsList": recipes},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

// [CustomRecipeItem(nameOfRecipe: "Meat")],
