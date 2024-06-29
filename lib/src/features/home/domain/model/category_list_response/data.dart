import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  final int? count;
  final List<Category>? categories;

  const Data({this.count, this.categories});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    int? count,
    List<Category>? categories,
  }) {
    return Data(
      count: count ?? this.count,
      categories: categories ?? this.categories,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [count, categories];
}
