import 'dart:convert';

import 'package:fake_store_app/models/index.dart';
import 'package:fake_store_app/utils/services/network/index.dart';

/// A repository interface for fetching product data.
///
/// This abstract class defines the contract for accessing product data.
abstract class BaseProductRepository {
  /// Returns a Future that resolves to a list of [Product] objects.
  Future<List<Product>> fetchProducts();
}

/// Implementation of [BaseProductRepository] for fetching products.
class ProductRepository implements BaseProductRepository {
  final NetworkImplService _client;

  ProductRepository({required NetworkImplService client}) : _client = client;

  @override
  Future<List<Product>> fetchProducts() async {
    try {
      final response = await _client.get(
        url: '/products',
        parameters: {},
      );

      final List<dynamic> data = json.decode(response);
      return data.map((item) => Product.fromMap(item)).toList();
    } catch (e) {
      rethrow;
    }
  }
}
