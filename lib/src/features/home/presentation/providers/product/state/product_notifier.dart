import 'dart:convert';

import '../../../../../../core/shared/domain/models/common_response.dart';
import '../../../../domain/repositories/product_repository.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/shared/domain/models/either.dart';
import '../../../../../../core/shared/exceptions/app_exceptions.dart';
import '../../../../domain/model/product_list_response/product_list_response.dart';
import 'product_state.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  final ProductRepository productRepository;

  ProductNotifier(
    this.productRepository,
  ) : super(const ProductState.initial());

  bool get isFetching =>
      state.status != ProductStatus.loading &&
      state.status != ProductStatus.fetchingMore;

  Future<void> fetchProducts({required String category}) async {
    state = state.copyWith(
      status: ProductStatus.loading,
      isLoading: true,
    );

    final response = await productRepository.fetchProducts(category: category);

    updateStateFromResponse(response);
  }

  // Future<void> searchProducts(String query) async {
  //   if (isFetching &&
  //       state.status != SliderConcreteState.fetchedAllProducts) {
  //     state = state.copyWith(
  //       status: state.page > 0
  //           ? SliderConcreteState.fetchingMore
  //           : SliderConcreteState.loading,
  //       isLoading: true,
  //     );

  //     final response = await SliderRepository.searchProducts(
  //       skip: state.page * PRODUCTS_PER_PAGE,
  //       query: query,
  //     );

  //     updateStateFromResponse(response);
  //   } else {
  //     state = state.copyWith(
  //       status: SliderConcreteState.fetchedAllProducts,
  //       message: 'No more products available',
  //       isLoading: false,
  //     );
  //   }
  // }

  void updateStateFromResponse(
      Either<AppException, CommonResponse<dynamic>> response) {
    response.fold((failure) {
      state = state.copyWith(
        status: ProductStatus.failure,
        message: failure.message,
        isLoading: false,
      );
    }, (data) {
      print(data.data);
      final productResp =
          ProductListResponse.fromJson(jsonDecode(jsonEncode(data.data)));

      // final totalColumnNews = [...state.posts, ...postList];
      print(productResp);

      state = state.copyWith(
        productResp: productResp,
        status: ProductStatus.loaded,
        hasData: true,
        // message: totalColumnNews.isEmpty ? 'No products found' : '',
        page: state.page,
        // total: totalColumnNews.length,
        isLoading: false,
      );
    });
  }

  void resetState() {
    state = const ProductState.initial();
  }
}
