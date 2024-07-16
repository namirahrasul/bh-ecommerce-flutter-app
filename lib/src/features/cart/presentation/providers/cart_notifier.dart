import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/cart.dart';
import '../../data/repositories/card_repositories.dart';

final cartNotifierProvider =
    StateNotifierProvider<CartNotifier, AsyncValue<Cart>>((ref) {
  final repository = ref.watch(cartRepositoryProvider);
  return CartNotifier(repository);
});

class CartNotifier extends StateNotifier<AsyncValue<Cart>> {
  final CartRepository _repository;

  CartNotifier(this._repository) : super(const AsyncLoading()) {
    _loadCart();
  }

  Future<void> _loadCart() async {
    try {
      final cart = await _repository.getCart();
      state = AsyncData(cart);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> addItem(CartItem item) async {
    if (state is AsyncData<Cart>) {
      final cart = state.asData!.value;
      bool isAvailable = cart.items.contains(item);
      // final updatedCart = cart.copyWith(items: [...cart.items, item]);
      if (!isAvailable) {
        final updatedCart = cart.copyWith(
          items: [...cart.items, item],
        );
        state = AsyncData(updatedCart);
        await _repository.saveCart(updatedCart);
      } else {
        final updatedCart = cart.copyWith(
          items: cart.items
              .map((e) => e.name == item.name
                  ? CartItem(
                      name: item.name,
                      price: item.price,
                      quantity: e.quantity + 1,
                    )
                  : e)
              .toList(),
        );
        state = AsyncData(updatedCart);
        await _repository.saveCart(updatedCart);
      }
    }
  }

  Future<void> updateItem(CartItem item) async {
    if (state is AsyncData<Cart>) {
      final cart = state.asData!.value;
      final updatedCart = cart.copyWith(
        items: cart.items.map((e) => e.name == item.name ? item : e).toList(),
      );
      state = AsyncData(updatedCart);
      await _repository.saveCart(updatedCart);
    }
  }
}
