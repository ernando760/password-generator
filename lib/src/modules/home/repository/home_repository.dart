import 'dart:developer';

import 'package:password_generator/src/modules/services/local_storage.dart';

abstract class HomeRepository {
  Future<void> savePassword(String password);
}

class IHomeRepository implements HomeRepository {
  IHomeRepository(this._localStorage);
  final LocalStorage _localStorage;

  @override
  Future<void> savePassword(String password) async {
    var passwords = _localStorage.getAll("passwords");
    if (passwords != null) {
      passwords = [password, ...passwords];
      await _localStorage.saveList("passwords", passwords);
      log("$passwords", name: "\$savePassword");
      return;
    }
    passwords = [password];
    await _localStorage.saveList("passwords", passwords);
    log("$passwords", name: "\$savePassword");
  }
}
