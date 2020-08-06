// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

abstract class _$Category {
  int get id;
  String get type;
  String get image;
  List<Property> get ls;

  Category copyWith({int id, String type, String image, List<Property> ls});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Category implements _Category {
  const _$_Category(this.id, this.type, this.image, this.ls);

  factory _$_Category.fromJson(Map<String, dynamic> json) =>
      _$_$_CategoryFromJson(json);

  @override
  final int id;
  @override
  final String type;
  @override
  final String image;
  @override
  final List<Property> ls;

  @override
  String toString() {
    return 'Category(id: $id, type: $type, image: $image, ls: $ls)';
  }

  @override
  bool operator ==(dynamic other) {
    return other is _Category &&
        (identical(other.id, id) || other.id == id) &&
        (identical(other.type, type) || other.type == type) &&
        (identical(other.image, image) || other.image == image) &&
        (identical(other.ls, ls) || other.ls == ls);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      id.hashCode ^
      type.hashCode ^
      image.hashCode ^
      ls.hashCode;

  @override
  _$_Category copyWith({
    Object id = immutable,
    Object type = immutable,
    Object image = immutable,
    Object ls = immutable,
  }) {
    return _$_Category(
      id == immutable ? this.id : id as int,
      type == immutable ? this.type : type as String,
      image == immutable ? this.image : image as String,
      ls == immutable ? this.ls : ls as List<Property>,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CategoryToJson(this);
  }
}

abstract class _Category implements Category {
  const factory _Category(
      int id, String type, String image, List<Property> ls) = _$_Category;

  factory _Category.fromJson(Map<String, dynamic> json) = _$_Category.fromJson;

  @override
  int get id;
  @override
  String get type;
  @override
  String get image;
  @override
  List<Property> get ls;

  @override
  _Category copyWith({int id, String type, String image, List<Property> ls});
}
