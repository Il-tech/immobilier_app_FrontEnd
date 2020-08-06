// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

abstract class _$User {
  int get id;
  String get name;
  String get telephone;
  int get genre;
  String get ville;
  String get adresse;
  String get code_postal;
  String get email;

  User copyWith(
      {int id,
      String name,
      String telephone,
      int genre,
      String ville,
      String adresse,
      String code_postal,
      String email});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_User implements _User {
  const _$_User(this.id, this.name, this.telephone, this.genre, this.ville,
      this.adresse, this.code_postal, this.email);

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String telephone;
  @override
  final int genre;
  @override
  final String ville;
  @override
  final String adresse;
  @override
  final String code_postal;
  @override
  final String email;

  @override
  String toString() {
    return 'User(id: $id, name: $name, telephone: $telephone, genre: $genre, ville: $ville, adresse: $adresse, code_postal: $code_postal, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return other is _User &&
        (identical(other.id, id) || other.id == id) &&
        (identical(other.name, name) || other.name == name) &&
        (identical(other.telephone, telephone) ||
            other.telephone == telephone) &&
        (identical(other.genre, genre) || other.genre == genre) &&
        (identical(other.ville, ville) || other.ville == ville) &&
        (identical(other.adresse, adresse) || other.adresse == adresse) &&
        (identical(other.code_postal, code_postal) ||
            other.code_postal == code_postal) &&
        (identical(other.email, email) || other.email == email);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      id.hashCode ^
      name.hashCode ^
      telephone.hashCode ^
      genre.hashCode ^
      ville.hashCode ^
      adresse.hashCode ^
      code_postal.hashCode ^
      email.hashCode;

  @override
  _$_User copyWith({
    Object id = immutable,
    Object name = immutable,
    Object telephone = immutable,
    Object genre = immutable,
    Object ville = immutable,
    Object adresse = immutable,
    Object code_postal = immutable,
    Object email = immutable,
  }) {
    return _$_User(
      id == immutable ? this.id : id as int,
      name == immutable ? this.name : name as String,
      telephone == immutable ? this.telephone : telephone as String,
      genre == immutable ? this.genre : genre as int,
      ville == immutable ? this.ville : ville as String,
      adresse == immutable ? this.adresse : adresse as String,
      code_postal == immutable ? this.code_postal : code_postal as String,
      email == immutable ? this.email : email as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(int id, String name, String telephone, int genre,
      String ville, String adresse, String code_postal, String email) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get telephone;
  @override
  int get genre;
  @override
  String get ville;
  @override
  String get adresse;
  @override
  String get code_postal;
  @override
  String get email;

  @override
  _User copyWith(
      {int id,
      String name,
      String telephone,
      int genre,
      String ville,
      String adresse,
      String code_postal,
      String email});
}
