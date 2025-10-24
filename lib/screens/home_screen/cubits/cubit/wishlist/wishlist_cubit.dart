import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_store_app/models/index.dart';
import 'package:flutter/foundation.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(const WishlistState());

  final Set<int> _wishlistIds = {}; // for fast lookup of items in wishlist

  void toggleWishlist(Product product) {
    if (_wishlistIds.contains(product.id)) {
      _wishlistIds.remove(product.id);
      emit(
        WishlistState(
          wishlist: state.wishlist.where((p) => p.id != product.id).toList(),
        ),
      );
    } else {
      _wishlistIds.add(product.id);
      emit(
        WishlistState(
          wishlist: List.from(state.wishlist)..add(product),
        ),
      );
    }
  }

  bool isInWishlist(Product product) {
    return _wishlistIds.contains(product.id); // O(1)
  }
}
