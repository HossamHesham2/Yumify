// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeDetailsModel _$RecipeDetailsModelFromJson(Map<String, dynamic> json) =>
    RecipeDetailsModel(
      id: json['id'] as num?,
      image: json['image'] as String?,
      imageType: json['imageType'] as String?,
      title: json['title'] as String?,
      readyInMinutes: json['readyInMinutes'] as num?,
      servings: json['servings'] as num?,
      sourceUrl: json['sourceUrl'] as String?,
      vegetarian: json['vegetarian'] as bool?,
      vegan: json['vegan'] as bool?,
      glutenFree: json['glutenFree'] as bool?,
      dairyFree: json['dairyFree'] as bool?,
      veryHealthy: json['veryHealthy'] as bool?,
      cheap: json['cheap'] as bool?,
      veryPopular: json['veryPopular'] as bool?,
      sustainable: json['sustainable'] as bool?,
      lowFodmap: json['lowFodmap'] as bool?,
      weightWatcherSmartPoints: json['weightWatcherSmartPoints'] as num?,
      gaps: json['gaps'] as String?,
      preparationMinutes: json['preparationMinutes'] as num?,
      cookingMinutes: json['cookingMinutes'] as num?,
      aggregateLikes: json['aggregateLikes'] as num?,
      healthScore: json['healthScore'] as num?,
      creditsText: json['creditsText'] as String?,
      license: json['license'] as String?,
      sourceName: json['sourceName'] as String?,
      pricePerServing: json['pricePerServing'] as num?,
      extendedIngredients: (json['extendedIngredients'] as List<dynamic>?)
          ?.map((e) => ExtendedIngredients.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: json['summary'] as String?,
      cuisines: json['cuisines'] as List<dynamic>?,
      dishTypes: (json['dishTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      diets: json['diets'] as List<dynamic>?,
      occasions: json['occasions'] as List<dynamic>?,
      instructions: json['instructions'] as String?,
      analyzedInstructions: json['analyzedInstructions'] as List<dynamic>?,
      spoonacularScore: json['spoonacularScore'] as num?,
      spoonacularSourceUrl: json['spoonacularSourceUrl'] as String?,
    );

Map<String, dynamic> _$RecipeDetailsModelToJson(RecipeDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'imageType': instance.imageType,
      'title': instance.title,
      'readyInMinutes': instance.readyInMinutes,
      'servings': instance.servings,
      'sourceUrl': instance.sourceUrl,
      'vegetarian': instance.vegetarian,
      'vegan': instance.vegan,
      'glutenFree': instance.glutenFree,
      'dairyFree': instance.dairyFree,
      'veryHealthy': instance.veryHealthy,
      'cheap': instance.cheap,
      'veryPopular': instance.veryPopular,
      'sustainable': instance.sustainable,
      'lowFodmap': instance.lowFodmap,
      'weightWatcherSmartPoints': instance.weightWatcherSmartPoints,
      'gaps': instance.gaps,
      'preparationMinutes': instance.preparationMinutes,
      'cookingMinutes': instance.cookingMinutes,
      'aggregateLikes': instance.aggregateLikes,
      'healthScore': instance.healthScore,
      'creditsText': instance.creditsText,
      'license': instance.license,
      'sourceName': instance.sourceName,
      'pricePerServing': instance.pricePerServing,
      'extendedIngredients': instance.extendedIngredients
          ?.map((e) => e.toJson())
          .toList(),
      'summary': instance.summary,
      'cuisines': instance.cuisines,
      'dishTypes': instance.dishTypes,
      'diets': instance.diets,
      'occasions': instance.occasions,
      'instructions': instance.instructions,
      'analyzedInstructions': instance.analyzedInstructions,
      'spoonacularScore': instance.spoonacularScore,
      'spoonacularSourceUrl': instance.spoonacularSourceUrl,
    };

ExtendedIngredients _$ExtendedIngredientsFromJson(Map<String, dynamic> json) =>
    ExtendedIngredients(
      id: json['id'] as num?,
      aisle: json['aisle'] as String?,
      image: json['image'] as String?,
      consistency: json['consistency'] as String?,
      name: json['name'] as String?,
      nameClean: json['nameClean'] as String?,
      original: json['original'] as String?,
      originalName: json['originalName'] as String?,
      amount: json['amount'] as num?,
      unit: json['unit'] as String?,
      meta: (json['meta'] as List<dynamic>?)?.map((e) => e as String).toList(),
      measures: json['measures'] == null
          ? null
          : Measures.fromJson(json['measures'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExtendedIngredientsToJson(
  ExtendedIngredients instance,
) => <String, dynamic>{
  'id': instance.id,
  'aisle': instance.aisle,
  'image': instance.image,
  'consistency': instance.consistency,
  'name': instance.name,
  'nameClean': instance.nameClean,
  'original': instance.original,
  'originalName': instance.originalName,
  'amount': instance.amount,
  'unit': instance.unit,
  'meta': instance.meta,
  'measures': instance.measures?.toJson(),
};

Measures _$MeasuresFromJson(Map<String, dynamic> json) => Measures(
  us: json['us'] == null
      ? null
      : Us.fromJson(json['us'] as Map<String, dynamic>),
  metric: json['metric'] == null
      ? null
      : Metric.fromJson(json['metric'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MeasuresToJson(Measures instance) => <String, dynamic>{
  'us': instance.us,
  'metric': instance.metric,
};

Metric _$MetricFromJson(Map<String, dynamic> json) => Metric(
  amount: json['amount'] as num?,
  unitShort: json['unitShort'] as String?,
  unitLong: json['unitLong'] as String?,
);

Map<String, dynamic> _$MetricToJson(Metric instance) => <String, dynamic>{
  'amount': instance.amount,
  'unitShort': instance.unitShort,
  'unitLong': instance.unitLong,
};

Us _$UsFromJson(Map<String, dynamic> json) => Us(
  amount: json['amount'] as num?,
  unitShort: json['unitShort'] as String?,
  unitLong: json['unitLong'] as String?,
);

Map<String, dynamic> _$UsToJson(Us instance) => <String, dynamic>{
  'amount': instance.amount,
  'unitShort': instance.unitShort,
  'unitLong': instance.unitLong,
};
