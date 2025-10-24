import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_store_app/models/index.dart';
import 'package:flutter/material.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState());

  void addToCart(Product product, {int quantity = 1}) {
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
        quantity: existingItem.quantity + quantity,
      );
    } else {
      // Product doesn't exist, add new item
      currentCart.add(
        CartItem(
          product: product,
          quantity: quantity,
        ),
      );
    }
    emit(CartState(cart: currentCart));
  }

  void removeFromCart(int productId) {
    final currentCart = state.cart
        .where((item) => item.product.id != productId)
        .toList();
    emit(CartState(cart: currentCart));
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
