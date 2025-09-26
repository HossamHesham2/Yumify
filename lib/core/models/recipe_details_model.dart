import 'package:json_annotation/json_annotation.dart';

part 'recipe_details_model.g.dart';

@JsonSerializable(explicitToJson: true)
class RecipeDetailsModel {
  final num? id;
  final String? image;
  final String? imageType;
  final String? title;
  final num? readyInMinutes;
  final num? servings;
  final String? sourceUrl;
  final bool? vegetarian;
  final bool? vegan;
  final bool? glutenFree;
  final bool? dairyFree;
  final bool? veryHealthy;
  final bool? cheap;
  final bool? veryPopular;
  final bool? sustainable;
  final bool? lowFodmap;
  final num? weightWatcherSmartPoints;
  final String? gaps;
  final num? preparationMinutes;
  final num? cookingMinutes;
  final num? aggregateLikes;
  final num? healthScore;
  final String? creditsText;
  final String? license;
  final String? sourceName;
  final num? pricePerServing;
  final List<ExtendedIngredients>? extendedIngredients;
  final String? summary;
  final List<dynamic>? cuisines;
  final List<String>? dishTypes;
  final List<dynamic>? diets;
  final List<dynamic>? occasions;
  final String? instructions;
  final List<dynamic>? analyzedInstructions;
  final num? spoonacularScore;
  final String? spoonacularSourceUrl;

  RecipeDetailsModel({
    this.id,
    this.image,
    this.imageType,
    this.title,
    this.readyInMinutes,
    this.servings,
    this.sourceUrl,
    this.vegetarian,
    this.vegan,
    this.glutenFree,
    this.dairyFree,
    this.veryHealthy,
    this.cheap,
    this.veryPopular,
    this.sustainable,
    this.lowFodmap,
    this.weightWatcherSmartPoints,
    this.gaps,
    this.preparationMinutes,
    this.cookingMinutes,
    this.aggregateLikes,
    this.healthScore,
    this.creditsText,
    this.license,
    this.sourceName,
    this.pricePerServing,
    this.extendedIngredients,
    this.summary,
    this.cuisines,
    this.dishTypes,
    this.diets,
    this.occasions,
    this.instructions,
    this.analyzedInstructions,
    this.spoonacularScore,
    this.spoonacularSourceUrl,
  });

  factory RecipeDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeDetailsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ExtendedIngredients {
  final num? id;
  final String? aisle;
  final String? image;
  final String? consistency;
  final String? name;
  final String? nameClean;
  final String? original;
  final String? originalName;
  final num? amount;
  final String? unit;
  final List<String>? meta;
  final Measures? measures;

  ExtendedIngredients({
    this.id,
    this.aisle,
    this.image,
    this.consistency,
    this.name,
    this.nameClean,
    this.original,
    this.originalName,
    this.amount,
    this.unit,
    this.meta,
    this.measures,
  });

  factory ExtendedIngredients.fromJson(Map<String, dynamic> json) =>
      _$ExtendedIngredientsFromJson(json);

  Map<String, dynamic> toJson() => _$ExtendedIngredientsToJson(this);
}

@JsonSerializable()
class Measures {
  final Us? us;
  final Metric? metric;

  Measures({this.us, this.metric});

  factory Measures.fromJson(Map<String, dynamic> json) =>
      _$MeasuresFromJson(json);

  Map<String, dynamic> toJson() => _$MeasuresToJson(this);
}

@JsonSerializable()
class Metric {
  final num? amount;
  final String? unitShort;
  final String? unitLong;

  Metric({this.amount, this.unitShort, this.unitLong});

  factory Metric.fromJson(Map<String, dynamic> json) => _$MetricFromJson(json);

  Map<String, dynamic> toJson() => _$MetricToJson(this);
}

@JsonSerializable()
class Us {
  final num? amount;
  final String? unitShort;
  final String? unitLong;

  Us({this.amount, this.unitShort, this.unitLong});

  factory Us.fromJson(Map<String, dynamic> json) => _$UsFromJson(json);

  Map<String, dynamic> toJson() => _$UsToJson(this);
}
