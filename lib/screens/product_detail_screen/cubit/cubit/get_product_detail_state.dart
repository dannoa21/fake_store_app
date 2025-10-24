part of 'get_product_detail_cubit.dart';

sealed class GetProductDetailState extends Equatable {
  const GetProductDetailState();

  @override
  List<Object> get props => [];
}

final class GetProductDetailInitial extends GetProductDetailState {}

final class GetProductDetailLoading extends GetProductDetailState {}

final class GetProductDetailSuccess extends GetProductDetailState {
  final Product product;

  const GetProductDetailSuccess({required this.product});

  @override
  List<Object> get props => [product];
}

final class GetProductDetailFailure extends GetProductDetailState {}
