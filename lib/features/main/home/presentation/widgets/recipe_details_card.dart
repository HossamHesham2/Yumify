import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipes_generator/core/models/recipe_details_model.dart';
import 'package:recipes_generator/core/utils/colors_manager.dart';
import 'package:recipes_generator/core/utils/font_manager.dart';
import 'package:recipes_generator/core/utils/poppins_style_manager.dart';
import 'package:recipes_generator/core/widgets/custom_elevated_button.dart';
import 'package:recipes_generator/features/main/home/presentation/widgets/custom_list_of_ingredients.dart';
import 'package:share_plus/share_plus.dart';

class RecipeDetailsCard extends StatefulWidget {
  final RecipeDetailsModel? recipeDetailsModel;

  const RecipeDetailsCard({super.key, required this.recipeDetailsModel});

  @override
  State<RecipeDetailsCard> createState() => _RecipeDetailsCardState();
}

class _RecipeDetailsCardState extends State<RecipeDetailsCard> {
  bool? isSelected = false;

  String getDifficulty(num minutes, int ingredientsCount) {
    if (minutes < 30 && ingredientsCount <= 8) {
      return "Easy";
    } else if (minutes >= 30 && minutes <= 60 && ingredientsCount <= 10) {
      return "Medium";
    } else if (minutes > 60 || ingredientsCount > 10) {
      return "Hard";
    }
    return "Medium"; // fallback
  }

  Color getDifficultyColor(String difficulty) {
    switch (difficulty) {
      case "Easy":
        return ColorsManager.green4C.withValues(alpha: 0.3);
      case "Medium":
        return ColorsManager.orangeF7.withValues(alpha: 0.3);
      case "Hard":
        return ColorsManager.orangeEf.withValues(alpha: 0.3);
      default:
        return ColorsManager.grey4B.withValues(alpha: 0.3);
    }
  }

  Color getDifficultyMinutesColor(num minutes) {
    if (minutes < 31) {
      return ColorsManager.green4C.withValues(alpha: 0.3);
    } else if (minutes > 30 && minutes < 61) {
      return ColorsManager.orangeF7.withValues(alpha: 0.3);
    } else if (minutes > 60) {
      return ColorsManager.orangeEf.withValues(alpha: 0.3);
    } else {
      return ColorsManager.grey4B.withValues(alpha: 0.3);
    }
  }

  Color getDifficultyMinutesIconColor(num minutes) {
    if (minutes < 31) {
      return ColorsManager.green4C;
    } else if (minutes > 30 && minutes < 61) {
      return ColorsManager.orangeF7;
    } else if (minutes > 60) {
      return ColorsManager.orangeEf;
    } else {
      return ColorsManager.grey4B;
    }
  }

  Color getDifficultyIconColor(String difficulty) {
    switch (difficulty) {
      case "Easy":
        return ColorsManager.green4C;
      case "Medium":
        return ColorsManager.orangeF7;
      case "Hard":
        return ColorsManager.orangeEf;
      default:
        return ColorsManager.grey4B;
    }
  }

  @override
  Widget build(BuildContext context) {
    final numOfExtendedIngredients =
        widget.recipeDetailsModel?.extendedIngredients?.length ?? 0;
    final minutes = widget.recipeDetailsModel?.readyInMinutes ?? 0;
    final difficulty = getDifficulty(minutes, numOfExtendedIngredients);
    final extendedIngredients = widget.recipeDetailsModel?.extendedIngredients;
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
          color: ColorsManager.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.recipeDetailsModel?.title ?? "",
                style: PoppinsStyleManager.bold(fontSize: FontSizeManager.s24),
              ),
              SizedBox(height: 10.h),
              Row(
                spacing: 20.w,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99999.r),
                      color: getDifficultyMinutesColor(minutes),
                    ),
                    child: Row(
                      spacing: 10.w,
                      children: [
                        Icon(
                          Icons.watch_later,
                          size: 20.sp,
                          color: getDifficultyMinutesIconColor(minutes),
                        ),
                        Text(
                          "$minutes min",
                          style: PoppinsStyleManager.medium(),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99999.r),
                      color: getDifficultyColor(difficulty),
                    ),
                    child: Row(
                      spacing: 10.w,
                      children: [
                        Icon(
                          Icons.signal_cellular_alt,
                          size: 20.sp,
                          color: getDifficultyIconColor(difficulty),
                        ),
                        Text(difficulty, style: PoppinsStyleManager.medium()),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Text(
                "Ingredients",
                style: PoppinsStyleManager.semiBold(
                  fontSize: FontSizeManager.s18,
                ),
              ),
              SizedBox(height: 10.h),
              CustomListOfIngredients(
                extendedIngredients: extendedIngredients ?? [],
              ),
              SizedBox(height: 15.h),
              Text(
                "Instructions",
                style: PoppinsStyleManager.semiBold(
                  fontSize: FontSizeManager.s18,
                ),
              ),
              SizedBox(height: 10.h),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final Map<String, dynamic> analyzedInstructions =
                      widget.recipeDetailsModel?.analyzedInstructions?[index];
                  final List steps = analyzedInstructions['steps'];
                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 10.h),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: steps.length,
                    itemBuilder: (context, index) => Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: ColorsManager.orangeF7,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            steps[index]['number'].toString(),
                            style: PoppinsStyleManager.semiBold(
                              color: ColorsManager.white,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            steps[index]['step'],
                            style: PoppinsStyleManager.regular(
                              fontSize: FontSizeManager.s16,
                            ),

                            textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(width: 10.w),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                itemCount:
                    widget.recipeDetailsModel?.analyzedInstructions?.length ??
                    0,
              ),
              SizedBox(height: 15.h),
              CustomElevatedButton(
                text: "Share Recipe",
                icon: Icons.share,
                onTap: () async {
                  final recipe = widget.recipeDetailsModel;
                  await SharePlus.instance.share(
                    ShareParams(
                      text:
                          'Try this recipe 😍:\n${recipe?.title}\n\n${recipe?.sourceUrl}',
                      subject: recipe?.title,
                    ),
                  );
                },
                image: "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
