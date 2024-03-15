import 'package:password_generator/src/modules/services/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesLocalStorage implements LocalStorage {
  SharedPreferencesLocalStorage() {
    Future(() async {
      _preferences = await SharedPreferences.getInstance();
    });
  }

  late final SharedPreferences _preferences;
  @override
  Future<void> delete(String key) async {
    await _preferences.remove(key);
  }

  @override
  List<String>? getAll(String key) {
    return _preferences.getStringList(key);
  }

  @override
  Future<bool?> save(String key, value) async {
    return await _preferences.setString(key, value);
  }

  @override
  Future<bool?> saveList(String key, List<String> values) async {
    return await _preferences.setStringList(key, values);
  }
}
