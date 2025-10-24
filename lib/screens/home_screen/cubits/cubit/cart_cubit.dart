import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_store_app/models/index.dart';
import 'package:flutter/material.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState());

  void addToCart({
    required Product product,
    int toBeAddedQuantity =
        1, // default to 1, but if we randomly want to add more than 1 at once
  }) {
    final currentCart = List<CartItem>.from(
      state.cart,
    );
    // Check if product already exists in cart
    final existingItemIndex = currentCart.indexWhere(
      (item) => item.product.id == product.id,
    );
    if (existingItemIndex != -1) {
      // Product exists, increase quantity
      final CartItem existingItem = currentCart[existingItemIndex];
      currentCart[existingItemIndex] = CartItem(
        product: existingItem.product,
        quantity: existingItem.quantity + toBeAddedQuantity,
      );
    } else {
      // Product doesn't exist, add new item
      currentCart.add(
        CartItem(
          product: product,
          quantity: toBeAddedQuantity,
        ),
      );
    }
    emit(CartState(cart: currentCart));
  }

  void removeFromCart(int productId) {
    try {
      final currentCart = state.cart
          .where((item) => item.product.id != productId)
          .toList();
      emit(CartState(cart: currentCart));
    } catch (e) {
      debugPrint('Error removing item from cart: $e');
    }
  }

  void updateQuantity(int productId, int newQuantity) {
    if (newQuantity <= 0) {
      removeFromCart(productId);
      return;
    }
    final currentCart = state.cart.map((item) {
      if (item.product.id == productId) {
        return CartItem(
          product: item.product,
          quantity: newQuantity,
        );
      }
      return item;
    }).toList();
    emit(CartState(cart: currentCart));
  }

  bool isInCart(Product product) {
    return state.cart.any((item) => item.product.id == product.id);
  }

  int get uniqueItemCount => state.cart.length;

  void clearCart() => emit(const CartState(cart: []));
}
