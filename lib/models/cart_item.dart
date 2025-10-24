part of 'index.dart';

class CartItem extends Equatable {
  final Product product;
  final int quantity;

  const CartItem({
    required this.product,
    required this.quantity,
  });

  @override
  List<Object?> get props => [product.id, quantity]; //to keep track of unique items in cart, we only need product.id from product model and quantity
}
