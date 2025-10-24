import 'package:bloc/bloc.dart';
import 'package:fake_store_app/core/repositories/product_repository.dart';
import 'package:fake_store_app/models/index.dart';
import 'package:flutter/material.dart';

part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  final ProductRepository _productRepository;
  GetProductsCubit({required ProductRepository productRepository})
    : _productRepository = productRepository,
      super(GetProductsInitial());

  Future<void> execute() async {
    try {
      emit(GetProductsLoading());
      final fetchedProducts = await _productRepository.fetchProducts();
      emit(
        GetProductsSuccess(products: fetchedProducts),
      );
    } catch (e) {
      emit(GetProductsFailure(errorMessage: e.toString()));
    }
  }
}
