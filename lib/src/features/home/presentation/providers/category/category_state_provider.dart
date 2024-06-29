

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'category_providers.dart';
import 'state/category_notifier.dart';
import 'state/category_state.dart';

final categoryNotifierProvider =
    StateNotifierProvider<CategoryNotifier, CategoryState>((ref) {
  final repository = ref.watch(categoryRepositoryProvider);
  return CategoryNotifier(repository)..fetchCategories(category: "category");
});
// final categoryEconomyNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryStockNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryTradeNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryNationalNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryBanglaNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categorySportsNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryEducationNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryYouthAndEntrepreneurshipNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryLifeStyleNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryWorldNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryViewsNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryMoreNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
// final categoryLiveMediaNotifierProvider =
//     StateNotifierProvider<CategoryWiseNewsNotifier, CategoryWiseNewsState>(
//         (ref) {
//   final repository = ref.watch(categoryWiseNewsRepositoryProvider);
//   return CategoryWiseNewsNotifier(repository);
// });
