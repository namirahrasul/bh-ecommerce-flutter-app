import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/model/cart.dart';

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  return CartRepositoryImpl();
});

abstract class CartRepository {
  Future<Cart> getCart();
  Future<void> saveCart(Cart cart);
}

class CartRepositoryImpl implements CartRepository {
  Cart _cart = Cart(items: []);

  @override
  Future<Cart> getCart() async {
    // Simulate network or database delay
    await Future.delayed(const Duration(seconds: 1));
    return _cart;
  }

  @override
  Future<void> saveCart(Cart cart) async {
    // Simulate network or database delay
    await Future.delayed(const Duration(seconds: 1));
    _cart = cart;
  }
}
