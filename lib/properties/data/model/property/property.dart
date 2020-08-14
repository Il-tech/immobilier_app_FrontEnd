import 'package:immobilierApp/categorie/data/model/category.dart';
import 'package:immobilierApp/properties/data/model/transaction/transaction.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
part 'property.freezed.dart';
part 'property.g.dart';

@immutable
abstract class Property with _$Property {
  const factory Property(
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'slug') String slug,
    @JsonKey(name: 'titre') String titre,
    @JsonKey(name: 'prix') double prix,
    @JsonKey(name: 'adresse') String adresse,
    @JsonKey(name: 'description') String description,
    @JsonKey(name: 'video') String video,
    @JsonKey(name: 'renewed_at') DateTime renewed_at,
    @JsonKey(name: 'nombre_facades') int nombre_facades,
    @JsonKey(name: 'nombre_chmbre') int nombre_chmbre,
    @JsonKey(name: 'transaction') Transaction transaction,
    @JsonKey(name: 'ville') String ville,
    @JsonKey(name: 'category') Category category,
    @JsonKey(name: 'imageHeader') String imageHeader,
    @JsonKey(name: 'isFavorite') bool isFavorite,
  ) = _Property;
  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);
}
