part of 'index.dart';

/// A service class for handling shared preferences in Flutter.
///
/// This class provides methods for reading, writing, removing, and clearing
/// data from shared preferences.
abstract class BaseSharedPreferencesService {
  /// Get a string value from shared preferences for the given [key].
  ///
  /// Returns null if the [key] is not present in shared preferences.
  String? getString(String key);

  /// Set a string [value] in shared preferences for the given [key].
  Future<void> setString(String key, String value);

  /// Remove a value from shared preferences for the given [key].
  Future<void> remove(String key);

  /// Clear all data from shared preferences.
  Future<void> clear();
}

/// Implementation of [BaseSharedPreferencesService] using SharedPreferences.
class SharedPreferencesService implements BaseSharedPreferencesService {
  static final SharedPreferencesService _instance = SharedPreferencesService._internal();
  late SharedPreferences _prefs;

  SharedPreferencesService._internal();

  /// Get the instance of [SharedPreferencesService].
  factory SharedPreferencesService() {
    return _instance;
  }

  /// Initialize SharedPreferences instance.
  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  String? getString(String key) {
    return _prefs.getString(key);
  }

  @override
  Future<void> setString(String key, String value) async {
    await _prefs.setString(key, value);
  }

  @override
  Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  @override
  Future<void> clear() async {
    await _prefs.clear();
  }
}
