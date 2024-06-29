import 'package:batter_high/src/core/shared/domain/models/common_response.dart';

import '../../../../core/shared/domain/models/either.dart';
import '../../../../core/shared/exceptions/app_exceptions.dart';

abstract class ProductRepository {
  Future<Either<AppException, CommonResponse>> fetchProducts(
      {String local = "en", required String category});
}
