abstract class LocalStorage {
  List<String>? getAll(String key);
  Future<bool?> save(String key, dynamic value);
  Future<void> delete(String key);
  Future<bool?> saveList(String key, List<String> values);
}
