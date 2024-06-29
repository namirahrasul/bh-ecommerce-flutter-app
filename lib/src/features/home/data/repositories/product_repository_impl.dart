import 'package:batter_high/src/features/home/data/remote/product_data_source_remote.dart';

import '../../../../core/shared/domain/models/either.dart';
import '../../../../core/shared/domain/models/common_response.dart';
import '../../../../core/shared/exceptions/app_exceptions.dart';
import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductDataSource productDataSource;
  ProductRepositoryImpl(this.productDataSource);

  @override
  Future<Either<AppException, CommonResponse>> fetchProducts(
      {String local = "en", required String category}) {
    return productDataSource.fetchProducts(local: local, category: category);
  }
}
