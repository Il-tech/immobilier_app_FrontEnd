// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Property _$PropertyFromJson(Map<String, dynamic> json) {
  return _Property.fromJson(json);
}

abstract class _$Property {
  int get id;
  String get slug;
  String get titre;
  double get prix;
  String get adresse;
  String get description;
  String get video;
  DateTime get renewed_at;
  int get nombre_facades;
  int get nombre_chmbre;
  Transaction get transaction;
  String get ville;
  Category get category;
  String get imageHeader;
  bool get isFavorite;

  Property copyWith(
      {int id,
      String slug,
      String titre,
      double prix,
      String adresse,
      String description,
      String video,
      DateTime renewed_at,
      int nombre_facades,
      int nombre_chmbre,
      Transaction transaction,
      String ville,
      Category category,
      String imageHeader,
      bool isFavorite});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Property implements _Property {
  const _$_Property(
      this.id,
      this.slug,
      this.titre,
      this.prix,
      this.adresse,
      this.description,
      this.video,
      this.renewed_at,
      this.nombre_facades,
      this.nombre_chmbre,
      this.transaction,
      this.ville,
      this.category,
      this.imageHeader,
      this.isFavorite);

  factory _$_Property.fromJson(Map<String, dynamic> json) =>
      _$_$_PropertyFromJson(json);

  @override
  final int id;
  @override
  final String slug;
  @override
  final String titre;
  @override
  final double prix;
  @override
  final String adresse;
  @override
  final String description;
  @override
  final String video;
  @override
  final DateTime renewed_at;
  @override
  final int nombre_facades;
  @override
  final int nombre_chmbre;
  @override
  final Transaction transaction;
  @override
  final String ville;
  @override
  final Category category;
  @override
  final String imageHeader;
  @override
  final bool isFavorite;

  @override
  String toString() {
    return 'Property(id: $id, slug: $slug, titre: $titre, prix: $prix, adresse: $adresse, description: $description, video: $video, renewed_at: $renewed_at, nombre_facades: $nombre_facades, nombre_chmbre: $nombre_chmbre, transaction: $transaction, ville: $ville, category: $category, imageHeader: $imageHeader, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(dynamic other) {
    return other is _Property &&
        (identical(other.id, id) || other.id == id) &&
        (identical(other.slug, slug) || other.slug == slug) &&
        (identical(other.titre, titre) || other.titre == titre) &&
        (identical(other.prix, prix) || other.prix == prix) &&
        (identical(other.adresse, adresse) || other.adresse == adresse) &&
        (identical(other.description, description) ||
            other.description == description) &&
        (identical(other.video, video) || other.video == video) &&
        (identical(other.renewed_at, renewed_at) ||
            other.renewed_at == renewed_at) &&
        (identical(other.nombre_facades, nombre_facades) ||
            other.nombre_facades == nombre_facades) &&
        (identical(other.nombre_chmbre, nombre_chmbre) ||
            other.nombre_chmbre == nombre_chmbre) &&
        (identical(other.transaction, transaction) ||
            other.transaction == transaction) &&
        (identical(other.ville, ville) || other.ville == ville) &&
        (identical(other.category, category) || other.category == category) &&
        (identical(other.imageHeader, imageHeader) ||
            other.imageHeader == imageHeader) &&
        (identical(other.isFavorite, isFavorite) ||
            other.isFavorite == isFavorite);
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      id.hashCode ^
      slug.hashCode ^
      titre.hashCode ^
      prix.hashCode ^
      adresse.hashCode ^
      description.hashCode ^
      video.hashCode ^
      renewed_at.hashCode ^
      nombre_facades.hashCode ^
      nombre_chmbre.hashCode ^
      transaction.hashCode ^
      ville.hashCode ^
      category.hashCode ^
      imageHeader.hashCode ^
      isFavorite.hashCode;

  @override
  _$_Property copyWith({
    Object id = immutable,
    Object slug = immutable,
    Object titre = immutable,
    Object prix = immutable,
    Object adresse = immutable,
    Object description = immutable,
    Object video = immutable,
    Object renewed_at = immutable,
    Object nombre_facades = immutable,
    Object nombre_chmbre = immutable,
    Object transaction = immutable,
    Object ville = immutable,
    Object category = immutable,
    Object imageHeader = immutable,
    Object isFavorite = immutable,
  }) {
    return _$_Property(
      id == immutable ? this.id : id as int,
      slug == immutable ? this.slug : slug as String,
      titre == immutable ? this.titre : titre as String,
      prix == immutable ? this.prix : prix as double,
      adresse == immutable ? this.adresse : adresse as String,
      description == immutable ? this.description : description as String,
      video == immutable ? this.video : video as String,
      renewed_at == immutable ? this.renewed_at : renewed_at as DateTime,
      nombre_facades == immutable ? this.nombre_facades : nombre_facades as int,
      nombre_chmbre == immutable ? this.nombre_chmbre : nombre_chmbre as int,
      transaction == immutable ? this.transaction : transaction as Transaction,
      ville == immutable ? this.ville : ville as String,
      category == immutable ? this.category : category as Category,
      imageHeader == immutable ? this.imageHeader : imageHeader as String,
      isFavorite == immutable ? this.isFavorite : isFavorite as bool,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PropertyToJson(this);
  }
}

abstract class _Property implements Property {
  const factory _Property(
      int id,
      String slug,
      String titre,
      double prix,
      String adresse,
      String description,
      String video,
      DateTime renewed_at,
      int nombre_facades,
      int nombre_chmbre,
      Transaction transaction,
      String ville,
      Category category,
      String imageHeader,
      bool isFavorite) = _$_Property;

  factory _Property.fromJson(Map<String, dynamic> json) = _$_Property.fromJson;

  @override
  int get id;
  @override
  String get slug;
  @override
  String get titre;
  @override
  double get prix;
  @override
  String get adresse;
  @override
  String get description;
  @override
  String get video;
  @override
  DateTime get renewed_at;
  @override
  int get nombre_facades;
  @override
  int get nombre_chmbre;
  @override
  Transaction get transaction;
  @override
  String get ville;
  @override
  Category get category;
  @override
  String get imageHeader;
  @override
  bool get isFavorite;

  @override
  _Property copyWith(
      {int id,
      String slug,
      String titre,
      double prix,
      String adresse,
      String description,
      String video,
      DateTime renewed_at,
      int nombre_facades,
      int nombre_chmbre,
      Transaction transaction,
      String ville,
      Category category,
      String imageHeader,
      bool isFavorite});
}
