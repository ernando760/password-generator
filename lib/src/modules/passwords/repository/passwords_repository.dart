import 'dart:developer';

import 'package:password_generator/src/modules/passwords/model/password_model.dart';
import 'package:password_generator/src/modules/services/local_storage.dart';

abstract class PasswordsRepository {
  List<PasswordModel> getAllPasswords();
  Future<List<PasswordModel>> deletePassword(PasswordModel passwordModel);
}

class IPasswordsRepository implements PasswordsRepository {
  IPasswordsRepository(this._localStorage);
  List<PasswordModel> _passwords = [];
  final LocalStorage _localStorage;

  @override
  Future<List<PasswordModel>> deletePassword(
      PasswordModel passwordModel) async {
    _passwords = getAllPasswords()
        .where((element) => element.password != passwordModel.password)
        .toList();
    await _localStorage.delete("passwords");
    await _localStorage.saveList(
        "passwords", _passwords.map((e) => e.password).toList());
    log("$_passwords", name: "\$deletePassword");
    return _passwords;
  }

  @override
  List<PasswordModel> getAllPasswords() {
    _passwords = List.from(_localStorage.getAll("passwords") ?? [])
        .cast<String>()
        .map((e) => PasswordModel(password: e))
        .toList();
    return _passwords;
  }
}
