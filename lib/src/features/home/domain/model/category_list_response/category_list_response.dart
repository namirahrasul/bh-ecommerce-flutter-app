import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'category_list_response.g.dart';

@JsonSerializable()
class CategoryListResponse extends Equatable {
  final bool? success;
  final int? statusCode;
  final String? message;
  final Data? data;

  const CategoryListResponse({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) {
    return _$CategoryListResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryListResponseToJson(this);

  CategoryListResponse copyWith({
    bool? success,
    int? statusCode,
    String? message,
    Data? data,
  }) {
    return CategoryListResponse(
      success: success ?? this.success,
      statusCode: statusCode ?? this.statusCode,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [success, statusCode, message, data];
}
