// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    json['id'] as int,
    json['name'] as String,
    json['telephone'] as String,
    json['genre'] as int,
    json['ville'] as String,
    json['adresse'] as String,
    json['code_postal'] as String,
    json['email'] as String,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'telephone': instance.telephone,
      'genre': instance.genre,
      'ville': instance.ville,
      'adresse': instance.adresse,
      'code_postal': instance.code_postal,
      'email': instance.email,
    };
