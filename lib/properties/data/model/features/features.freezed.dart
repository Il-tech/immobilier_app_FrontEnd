// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'features.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Features _$FeaturesFromJson(Map<String, dynamic> json) {
  return _Features.fromJson(json);
}

abstract class _$Features {
  String get feature_name;
  String get feature_value;

  Features copyWith({String feature_name, String feature_value});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Features implements _Features {
  const _$_Features(this.feature_name, this.feature_value);

  factory _$_Features.fromJson(Map<String, dynamic> json) =>
      _$_$_FeaturesFromJson(json);

  @override
  final String feature_name;
  @override
  final String feature_value;

  @override
  String toString() {
    return 'Features(feature_name: $feature_name, feature_value: $feature_value)';
  }

  @override
  bool operator ==(dynamic other) {
    return other is _Features &&
        (identical(other.feature_name, feature_name) ||
            other.feature_name == feature_name) &&
        (identical(other.feature_value, feature_value) ||
            other.feature_value == feature_value);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ feature_name.hashCode ^ feature_value.hashCode;

  @override
  _$_Features copyWith({
    Object feature_name = immutable,
    Object feature_value = immutable,
  }) {
    return _$_Features(
      feature_name == immutable ? this.feature_name : feature_name as String,
      feature_value == immutable ? this.feature_value : feature_value as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FeaturesToJson(this);
  }
}

abstract class _Features implements Features {
  const factory _Features(String feature_name, String feature_value) =
      _$_Features;

  factory _Features.fromJson(Map<String, dynamic> json) = _$_Features.fromJson;

  @override
  String get feature_name;
  @override
  String get feature_value;

  @override
  _Features copyWith({String feature_name, String feature_value});
}
