part of 'get_products_cubit.dart';

@immutable
sealed class GetProductsState {}

final class GetProductsInitial extends GetProductsState {}

final class GetProductsLoading extends GetProductsState {}

final class GetProductsSuccess extends GetProductsState {
  final List<Product> products;

  GetProductsSuccess({required this.products});
}

final class GetProductsFailure extends GetProductsState {
  final String errorMessage;

  GetProductsFailure({required this.errorMessage});
}
