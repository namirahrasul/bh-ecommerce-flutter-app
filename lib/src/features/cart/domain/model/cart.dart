class Cart {
  final List<CartItem> items;

  Cart({required this.items});

  Cart copyWith({List<CartItem>? items}) {
    return Cart(items: items ?? this.items);
  }
}

class CartItem {
  final String name;
  final double price;
  final int quantity;

  CartItem({required this.name, required this.price, required this.quantity});
}