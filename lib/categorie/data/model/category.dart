import 'package:immobilierApp/properties/data/model/property/property.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category.freezed.dart';
part 'category.g.dart';

@immutable
abstract class Category with _$Category {
  const factory Category(
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'type') String type,
    @JsonKey(name: 'image') String image,
    List<Property> ls,
  ) = _Category;
  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
