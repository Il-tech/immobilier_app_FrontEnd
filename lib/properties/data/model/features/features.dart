import 'package:immobilierApp/categorie/data/model/category.dart';
import 'package:immobilierApp/properties/data/model/transaction/transaction.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
part 'features.freezed.dart';
part 'features.g.dart';

@immutable
abstract class Features with _$Features {
  const factory Features(
    @JsonKey(name: 'feature_name') String feature_name,
    @JsonKey(name: 'feature_value') String feature_value,
  ) = _Features;
  factory Features.fromJson(Map<String, dynamic> json) =>
      _$FeaturesFromJson(json);
}
