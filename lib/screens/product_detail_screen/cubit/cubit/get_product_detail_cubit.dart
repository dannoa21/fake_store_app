import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fake_store_app/core/repositories/product_repository.dart';
import 'package:fake_store_app/models/index.dart';

part 'get_product_detail_state.dart';

class GetProductDetailCubit extends Cubit<GetProductDetailState> {
  final ProductRepository _productRepository;
  GetProductDetailCubit({required ProductRepository productRepository})
    : _productRepository = productRepository,
      super(GetProductDetailInitial());

  Future<void> execute({required int productId}) async {
    try {
      emit(GetProductDetailLoading());
      final product = await _productRepository.fetchProductDetail(
        id: productId,
      );
      emit(
        GetProductDetailSuccess(product: product),
      );
    } catch (e) {
      emit(GetProductDetailFailure());
    }
  }
}
