part of 'cart_cubit.dart';

@immutable
class CartState extends Equatable {
  final List<CartItem> cart;

  const CartState({this.cart = const []});

  @override
  List<Object?> get props => [cart];
}
