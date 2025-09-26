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

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocProvider(
          create: (context) =>
          getIt<HomeBloc>()
            ..add(LoadSavedRecipesEvent())..add(LoadFavoritesEvent()),

          child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state)

  {

  final favorites = state.favorites ?? [];

  if

  (

  favorites.isEmpty) {
  return const Center(child: Text("No favorites yet"));
  }
  return Padding(
  padding: const EdgeInsets.all(8.0),
  child: GridView.builder(
  itemBuilder: (context, index) {
  final recipe = favorites[index];
  return GestureDetector(
  onTap: () {
  Navigator.pushNamed(
  context,
  NameOfRoutes.recipeDetails,
  arguments: {"id": recipe.id},
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
  imageUrl: recipe.image ?? "",
  width: 136.w,
  height: 96.h,
  fit: BoxFit.cover,
  placeholder: (context, url) => Center(
  child: CircularProgressIndicator(
  color: ColorsManager.orangeF7,
  ),
  ),
  errorWidget: (context, url, error) => Center(
  child: Icon(
  Icons.broken_image_outlined,
  color: ColorsManager.orangeF7,
  fontWeight: FontWeightManager.semiBold,
  size: 45.sp,
  ),
  ),
  ),
  ),
  ),
  Text(
  recipe.title ?? "",
  style: PoppinsStyleManager.bold(),
  overflow: TextOverflow.ellipsis,
  maxLines: 1,
  ),
  Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  Row(
  spacing: 3.w,
  children: [
  Text("Likes :"),

  Text(recipe.aggregateLikes.toString()),
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
  );
  },
  itemCount: favorites.length,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  mainAxisSpacing: 16.h,
  crossAxisSpacing: 16.w,
  ),
  ),
  );
  return ListView.builder(
  itemCount: favorites.length,
  itemBuilder: (context, index) {
  final recipe = favorites[index];
  return ListTile(
  leading: Image.network(recipe.image ?? ""),
  title: Text(recipe.title ?? "No title"),
  );
  },

  );
},)
,
);
}
