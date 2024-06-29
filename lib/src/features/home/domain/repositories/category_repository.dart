import 'package:batter_high/src/core/shared/domain/models/common_response.dart';

import '../../../../core/shared/domain/models/either.dart';
import '../../../../core/shared/exceptions/app_exceptions.dart';

abstract class CategoryRepository {
  Future<Either<AppException,CommonResponse>> fetchCategories(
      {String local = "en", required String category});
}
