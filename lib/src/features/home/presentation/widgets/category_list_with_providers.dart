import 'dart:async';

import 'package:go_router/go_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/category_list_response/category.dart';
import '../providers/category/category_state_provider.dart';
import '../providers/category/state/category_state.dart';
import '../providers/category/state/category_notifier.dart';

class CategoryListWidget extends ConsumerStatefulWidget {
  const CategoryListWidget({super.key});

  @override
  ConsumerState<CategoryListWidget> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends ConsumerState<CategoryListWidget> {
  // final scrollController = ScrollController();
  // final TextEditingController searchController = TextEditingController();
  // bool isSearchActive = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    // scrollController.addListener(scrollControllerListener);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  // void scrollControllerListener() {
  //   if (scrollController.position.maxScrollExtent == scrollController.offset) {
  //     final notifier = ref.read(dashboardNotifierProvider.notifier);

  //     notifier.fetchProducts();
  //   }
  // }

  void refreshScrollControllerListener() {
    // scrollController.removeListener(scrollControllerListener);
    // scrollController.addListener(scrollControllerListener);
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(categoryNotifierProvider);

    // ref.listen(
    //   dashboardNotifierProvider.select((value) => value),
    //   ((DashboardState? previous, DashboardState next) {
    //     //show Snackbar on failure
    //     if (next.status == DashboardConcreteState.fetchedAllProducts) {
    //       if (next.message.isNotEmpty) {
    //         ScaffoldMessenger.of(context)
    //             .showSnackBar(SnackBar(content: Text(next.message.toString())));
    //       }
    //     }
    //   }),
    // );
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      child: state.status == CategoryStatus.loading
          ? const Center(
              child: CircularProgressIndicator.adaptive(
              backgroundColor: Colors.white,
            ))
          : state.hasData
              ? ListView.builder(
                  itemCount: state.categoryResp.data?.categories?.length ?? 0,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, i) {
                    return CategoryCard(
                        news: state.categoryResp.data!.categories![i]);
                  })
              : Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
    );
  }

  // _onSearchChanged(String query) {
  //   if (_debounce?.isActive ?? false) _debounce?.cancel();
  //   _debounce = Timer(const Duration(milliseconds: 500), () {
  //     ref.read(dashboardNotifierProvider.notifier).searchProducts(query);
  //   });
  // }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.news,
  });

  final Category news;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Column(children: [
        //if (news.image?.isNotEmpty == true)
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.computer),
          ),
        ),
      
      Padding(
        padding: const EdgeInsets.only(left: 16, top: 8),
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.black),
          child: Row(
            children: [
              Flexible(
                child: Text(
                  (news.name ?? "").toUpperCase(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
      ListTile(
        isThreeLine: true,
        dense: false,
        visualDensity: VisualDensity.standard,
        title: Text(
          news.name ?? "",
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
        // horizontalTitleGap: 8,
      ),
      ]),
    );
  }
}
