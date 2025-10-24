part of 'index.dart';

class TokenUtils {
  static Future<String?> getJwtToken() async {
    //Get the auth token(server token) from the Shared Preference here
    try {
      final SharedPreferencesService storage = SharedPreferencesService();

      final token = (storage.getString(SharedPreferencesKeys.authToken))!;
      return token;
    } catch (e) {
      return null;
    }
  }
}
