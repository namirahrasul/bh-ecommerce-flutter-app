import '../widgets/product_list_with_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import '../widgets/category_list_with_providers.dart';
import '../widgets/custom_title.dart';
import '../widgets/slider_widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 5));
    FlutterNativeSplash.remove();
  }

  List<String> categoryList = [
    'Category 1',
    'Category 2',
    'Category 3',
    'Category 4',
    'Category 5'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Icon(
                Icons.person,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Badge(
                label: Text('0'),
                child: Icon(
                  Icons.shopping_cart,
                ),
              ),
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverToBoxAdapter(
            child: CustomTitle(
              title: "Categories",
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              //child: CategoryList(categoryList: categoryList),
            ),
          ),
          const SliverToBoxAdapter(
            child: SliderWidgets(),
          ),
          const SliverToBoxAdapter(
            child: CustomTitle(
              title: "Products",
            ),
          ),
          SliverToBoxAdapter(child: const ProductListWidget())
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
