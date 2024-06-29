import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String? name;
  final int? noOfProducts;
  @JsonKey(name: '__v')
  final int? v;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Category({
    this.id,
    this.name,
    this.noOfProducts,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  Category copyWith({
    String? id,
    String? name,
    int? noOfProducts,
    int? v,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      noOfProducts: noOfProducts ?? this.noOfProducts,
      v: v ?? this.v,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      noOfProducts,
      v,
      createdAt,
      updatedAt,
    ];
  }
}
