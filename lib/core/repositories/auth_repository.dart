import 'dart:convert';

import 'package:fake_store_app/utils/services/network/index.dart';

/// Abstract class for handling user authentication.
abstract class BaseAuthRepository {
  Future<String> authenticateUser({
    required String username,
    required String password,
  });
}

/// Repository for handling authentication-related API requests.
class AuthRepository implements BaseAuthRepository {
  final NetworkImplService _client;

  AuthRepository({required NetworkImplService client}) : _client = client;

  @override
  Future<String> authenticateUser({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _client.post(
        url: '/auth/login',
        data: {
          "username": username,
          "password": password,
        },
        parameters: {},
      );

      return jsonDecode(response)['token'];
    } catch (e) {
      rethrow;
    }
  }
}
