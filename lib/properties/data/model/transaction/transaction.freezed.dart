// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

abstract class _$Transaction {
  int get id;
  String get type_name;

  Transaction copyWith({int id, String type_name});

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class _$_Transaction implements _Transaction {
  const _$_Transaction(this.id, this.type_name);

  factory _$_Transaction.fromJson(Map<String, dynamic> json) =>
      _$_$_TransactionFromJson(json);

  @override
  final int id;
  @override
  final String type_name;

  @override
  String toString() {
    return 'Transaction(id: $id, type_name: $type_name)';
  }

  @override
  bool operator ==(dynamic other) {
    return other is _Transaction &&
        (identical(other.id, id) || other.id == id) &&
        (identical(other.type_name, type_name) || other.type_name == type_name);
  }

  @override
  int get hashCode => runtimeType.hashCode ^ id.hashCode ^ type_name.hashCode;

  @override
  _$_Transaction copyWith({
    Object id = immutable,
    Object type_name = immutable,
  }) {
    return _$_Transaction(
      id == immutable ? this.id : id as int,
      type_name == immutable ? this.type_name : type_name as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TransactionToJson(this);
  }
}

abstract class _Transaction implements Transaction {
  const factory _Transaction(int id, String type_name) = _$_Transaction;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$_Transaction.fromJson;

  @override
  int get id;
  @override
  String get type_name;

  @override
  _Transaction copyWith({int id, String type_name});
}
