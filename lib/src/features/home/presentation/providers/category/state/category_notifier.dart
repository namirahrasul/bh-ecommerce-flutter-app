import 'dart:convert';

import '../../../../../../core/shared/domain/models/common_response.dart';
import '../../../../domain/repositories/category_repository.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/shared/domain/models/either.dart';
import '../../../../../../core/shared/exceptions/app_exceptions.dart';
import '../../../../domain/model/category_list_response/category_list_response.dart';
import 'category_state.dart';

class CategoryNotifier extends StateNotifier<CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryNotifier(
    this.categoryRepository,
  ) : super(const CategoryState.initial());

  bool get isFetching =>
      state.status != CategoryStatus.loading &&
      state.status != CategoryStatus.fetchingMore;

  Future<void> fetchCategories({required String category}) async {
    state = state.copyWith(
      status: CategoryStatus.loading,
      isLoading: true,
    );

    final response =
        await categoryRepository.fetchCategories(category: category);

    updateStateFromResponse(response);
  }

  // Future<void> searchCategorys(String query) async {
  //   if (isFetching &&
  //       state.status != SliderConcreteState.fetchedAllCategorys) {
  //     state = state.copyWith(
  //       status: state.page > 0
  //           ? SliderConcreteState.fetchingMore
  //           : SliderConcreteState.loading,
  //       isLoading: true,
  //     );

  //     final response = await SliderRepository.searchCategorys(
  //       skip: state.page * CategoryS_PER_PAGE,
  //       query: query,
  //     );

  //     updateStateFromResponse(response);
  //   } else {
  //     state = state.copyWith(
  //       status: SliderConcreteState.fetchedAllCategorys,
  //       message: 'No more Categorys available',
  //       isLoading: false,
  //     );
  //   }
  // }

  void updateStateFromResponse(
      Either<AppException, CommonResponse<dynamic>> response) {
    response.fold((failure) {
      state = state.copyWith(
        status: CategoryStatus.failure,
        message: failure.message,
        isLoading: false,
      );
    }, (data) {
      print(data.data);
      final CategoryResp =
          CategoryListResponse.fromJson(jsonDecode(jsonEncode(data.data)));

      // final totalColumnNews = [...state.posts, ...postList];
      print(CategoryResp);

      state = state.copyWith(
        CategoryResp: CategoryResp,
        status: CategoryStatus.loaded,
        hasData: true,
        // message: totalColumnNews.isEmpty ? 'No Categorys found' : '',
        page: state.page,
        // total: totalColumnNews.length,
        isLoading: false,
      );
    });
  }

  void resetState() {
    state = const CategoryState.initial();
  }
}
