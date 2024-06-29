

import '../../../../core/shared/domain/models/either.dart';
import '../../../../core/shared/domain/models/common_response.dart';
import '../../../../core/shared/exceptions/app_exceptions.dart';
import '../../domain/repositories/category_repository.dart';
import '../remote/category_data_source_remote.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryDataSource categoryDataSource;
  CategoryRepositoryImpl(this.categoryDataSource);

  @override
  Future<Either<AppException, CommonResponse>> fetchCategories(
      {String local = "en", required String category}) {
    return categoryDataSource.fetchCategories(local: local, category: category);
  }
}
