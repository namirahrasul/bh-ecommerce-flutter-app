import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/cart.dart';
import '../providers/cart_notifier.dart';

class CartPage extends ConsumerWidget {
  const CartPage({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: cartState.when(
        data: (cart) => ListView.builder(
          itemCount: cart.items.length,
          itemBuilder: (context, index) {
            final item = cart.items[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text('${item.price} x ${item.quantity}'),
            );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final cart = cartState.asData?.value;
          if (cart != null) {
            ref.read(cartNotifierProvider.notifier).addItem(CartItem(
                name: 'Item ${cart.items.length + 1}',
                price: 10.0,
                quantity: 1));
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}