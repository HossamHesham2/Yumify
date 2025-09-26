// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeModel _$RecipeModelFromJson(Map<String, dynamic> json) => RecipeModel(
  id: json['id'] as num,
  title: json['title'] as String,
  image: json['image'] as String,
  imageType: json['imageType'] as String,
  usedIngredientCount: json['usedIngredientCount'] as num,
  missedIngredientCount: json['missedIngredientCount'] as num,
  missedIngredients: (json['missedIngredients'] as List<dynamic>)
      .map((e) => MissedIngredients.fromJson(e as Map<String, dynamic>))
      .toList(),
  usedIngredients: (json['usedIngredients'] as List<dynamic>)
      .map((e) => UsedIngredients.fromJson(e as Map<String, dynamic>))
      .toList(),
  unusedIngredients: (json['unusedIngredients'] as List<dynamic>)
      .map((e) => UnusedIngredients.fromJson(e as Map<String, dynamic>))
      .toList(),
  likes: json['likes'] as num,
);

Map<String, dynamic> _$RecipeModelToJson(
  RecipeModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'image': instance.image,
  'imageType': instance.imageType,
  'usedIngredientCount': instance.usedIngredientCount,
  'missedIngredientCount': instance.missedIngredientCount,
  'missedIngredients': instance.missedIngredients
      .map((e) => e.toJson())
      .toList(),
  'usedIngredients': instance.usedIngredients.map((e) => e.toJson()).toList(),
  'unusedIngredients': instance.unusedIngredients
      .map((e) => e.toJson())
      .toList(),
  'likes': instance.likes,
};

MissedIngredients _$MissedIngredientsFromJson(Map<String, dynamic> json) =>
    MissedIngredients(
      id: json['id'] as num,
      amount: json['amount'] as num,
      unit: json['unit'] as String,
      unitLong: json['unitLong'] as String,
      unitShort: json['unitShort'] as String,
      aisle: json['aisle'] as String,
      name: json['name'] as String,
      original: json['original'] as String,
      originalName: json['originalName'] as String,
      meta: (json['meta'] as List<dynamic>).map((e) => e as String).toList(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$MissedIngredientsToJson(MissedIngredients instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'unit': instance.unit,
      'unitLong': instance.unitLong,
      'unitShort': instance.unitShort,
      'aisle': instance.aisle,
      'name': instance.name,
      'original': instance.original,
      'originalName': instance.originalName,
      'meta': instance.meta,
      'image': instance.image,
    };

UsedIngredients _$UsedIngredientsFromJson(Map<String, dynamic> json) =>
    UsedIngredients(
      id: json['id'] as num,
      amount: json['amount'] as num,
      unit: json['unit'] as String,
      unitLong: json['unitLong'] as String,
      unitShort: json['unitShort'] as String,
      aisle: json['aisle'] as String,
      name: json['name'] as String,
      original: json['original'] as String,
      originalName: json['originalName'] as String,
      meta: json['meta'] as List<dynamic>,
      image: json['image'] as String,
    );

Map<String, dynamic> _$UsedIngredientsToJson(UsedIngredients instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'unit': instance.unit,
      'unitLong': instance.unitLong,
      'unitShort': instance.unitShort,
      'aisle': instance.aisle,
      'name': instance.name,
      'original': instance.original,
      'originalName': instance.originalName,
      'meta': instance.meta,
      'image': instance.image,
    };

UnusedIngredients _$UnusedIngredientsFromJson(Map<String, dynamic> json) =>
    UnusedIngredients(
      id: json['id'] as num,
      amount: json['amount'] as num,
      unit: json['unit'] as String,
      unitLong: json['unitLong'] as String,
      unitShort: json['unitShort'] as String,
      aisle: json['aisle'] as String,
      name: json['name'] as String,
      original: json['original'] as String,
      originalName: json['originalName'] as String,
      meta: json['meta'] as List<dynamic>,
      image: json['image'] as String,
    );

Map<String, dynamic> _$UnusedIngredientsToJson(UnusedIngredients instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'unit': instance.unit,
      'unitLong': instance.unitLong,
      'unitShort': instance.unitShort,
      'aisle': instance.aisle,
      'name': instance.name,
      'original': instance.original,
      'originalName': instance.originalName,
      'meta': instance.meta,
      'image': instance.image,
    };
