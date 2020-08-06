import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@immutable
abstract class User with _$User {
  const factory User(
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'name') String name,
    @JsonKey(name: 'telephone') String telephone,
    @JsonKey(name: 'genre') int genre,
    @JsonKey(name: 'ville') String ville,
    @JsonKey(name: 'adresse') String adresse,
    @JsonKey(name: 'code_postal') String code_postal,
    @JsonKey(name: 'email') String email,
  ) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
