// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Property _$_$_PropertyFromJson(Map<String, dynamic> json) {
  return _$_Property(
    json['id'] as int,
    json['slug'] as String,
    json['titre'] as String,
    (json['prix'] as num)?.toDouble(),
    json['adresse'] as String,
    json['description'] as String,
    json['video'] as String,
    json['renewed_at'] == null
        ? null
        : DateTime.parse(json['renewed_at'] as String),
    json['nombre_facades'] as int,
    json['nombre_chmbre'] as int,
    json['transaction'] == null
        ? null
        : Transaction.fromJson(json['transaction'] as Map<String, dynamic>),
    json['ville'] as String,
    json['category'] == null
        ? null
        : Category.fromJson(json['category'] as Map<String, dynamic>),
    json['imageHeader'] as String,
  );
}

Map<String, dynamic> _$_$_PropertyToJson(_$_Property instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'titre': instance.titre,
      'prix': instance.prix,
      'adresse': instance.adresse,
      'description': instance.description,
      'video': instance.video,
      'renewed_at': instance.renewed_at?.toIso8601String(),
      'nombre_facades': instance.nombre_facades,
      'nombre_chmbre': instance.nombre_chmbre,
      'transaction': instance.transaction,
      'ville': instance.ville,
      'category': instance.category,
      'imageHeader': instance.imageHeader,
    };
