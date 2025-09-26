import 'package:json_annotation/json_annotation.dart';

part 'recipe_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RecipeModel {
  final num id;
  final String title;
  final String image;
  final String imageType;
  final num usedIngredientCount;
  final num missedIngredientCount;
  final List<MissedIngredients> missedIngredients;
  final List<UsedIngredients> usedIngredients;
  final List<UnusedIngredients> unusedIngredients;
  final num likes;

  RecipeModel({
    required this.id,
    required this.title,
    required this.image,
    required this.imageType,
    required this.usedIngredientCount,
    required this.missedIngredientCount,
    required this.missedIngredients,
    required this.usedIngredients,
    required this.unusedIngredients,
    required this.likes,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeModelToJson(this);
}

@JsonSerializable()
class MissedIngredients {
  final num id;
  final num amount;
  final String unit;
  final String unitLong;
  final String unitShort;
  final String aisle;
  final String name;
  final String original;
  final String originalName;
  final List<String> meta;
  final String image;

  MissedIngredients({
    required this.id,
    required this.amount,
    required this.unit,
    required this.unitLong,
    required this.unitShort,
    required this.aisle,
    required this.name,
    required this.original,
    required this.originalName,
    required this.meta,
    required this.image,
  });

  factory MissedIngredients.fromJson(Map<String, dynamic> json) =>
      _$MissedIngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$MissedIngredientsToJson(this);
}

@JsonSerializable()
class UsedIngredients {
  final num id;
  final num amount;
  final String unit;
  final String unitLong;
  final String unitShort;
  final String aisle;
  final String name;
  final String original;
  final String originalName;
  final List<dynamic> meta;
  final String image;

  UsedIngredients({
    required this.id,
    required this.amount,
    required this.unit,
    required this.unitLong,
    required this.unitShort,
    required this.aisle,
    required this.name,
    required this.original,
    required this.originalName,
    required this.meta,
    required this.image,
  });

  factory UsedIngredients.fromJson(Map<String, dynamic> json) =>
      _$UsedIngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$UsedIngredientsToJson(this);
}

@JsonSerializable()
class UnusedIngredients {
  final num id;
  final num amount;
  final String unit;
  final String unitLong;
  final String unitShort;
  final String aisle;
  final String name;
  final String original;
  final String originalName;
  final List<dynamic> meta;
  final String image;

  UnusedIngredients({
    required this.id,
    required this.amount,
    required this.unit,
    required this.unitLong,
    required this.unitShort,
    required this.aisle,
    required this.name,
    required this.original,
    required this.originalName,
    required this.meta,
    required this.image,
  });

  factory UnusedIngredients.fromJson(Map<String, dynamic> json) =>
      _$UnusedIngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$UnusedIngredientsToJson(this);
}
