part of 'wishlist_cubit.dart';

@immutable
class WishlistState extends Equatable {
  final List<Product> wishlist;

  const WishlistState({this.wishlist = const []});

  @override
  List<Object?> get props => [wishlist];
}
