import 'package:equatable/equatable.dart';
import '../../../../domain/model/category_list_response/category_list_response.dart';

enum CategoryStatus {
  initial,
  loading,
  loaded,
  failure,
  fetchingMore,
  fetchedAllCategories
}

class CategoryState extends Equatable {
  final CategoryListResponse categoryResp;
  final int total;
  final int page;
  final bool hasData;
  final CategoryStatus status;
  final String message;
  final bool isLoading;
  const CategoryState({
    this.categoryResp = const CategoryListResponse(),
    this.isLoading = false,
    this.hasData = false,
    this.status = CategoryStatus.initial,
    this.message = '',
    this.page = 0,
    this.total = 0,
  });

  const CategoryState.initial({
    this.categoryResp = const CategoryListResponse(),
    this.total = 0,
    this.page = 0,
    this.isLoading = false,
    this.hasData = false,
    this.status = CategoryStatus.initial,
    this.message = '',
  });

  CategoryState copyWith({
    CategoryListResponse? CategoryResp,
    int? total,
    int? page,
    bool? hasData,
    CategoryStatus? status,
    String? message,
    bool? isLoading,
  }) {
    return CategoryState(
      isLoading: isLoading ?? this.isLoading,
      categoryResp: categoryResp ?? this.categoryResp,
      total: total ?? this.total,
      page: page ?? this.page,
      hasData: hasData ?? this.hasData,
      status: status ?? this.status,
      message: message ?? this.message,
    );
  }

  @override
  String toString() {
    return 'DashboardState(isLoading:$isLoading,total:$total page: $page, hasData: $hasData, state: $status, message: $message)';
  }

  @override
  List<Object?> get props => [categoryResp, page, hasData, status, message];
}
