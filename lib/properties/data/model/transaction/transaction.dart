import 'package:immobilierApp/categorie/data/model/category.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
part 'transaction.freezed.dart';
part 'transaction.g.dart';

@immutable
abstract class Transaction with _$Transaction {
  const factory Transaction(
    @JsonKey(name: 'id') int id,
    @JsonKey(name: 'type_name') String type_name,
  ) = _Transaction;
  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}
