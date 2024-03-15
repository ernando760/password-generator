import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:password_generator/src/modules/passwords/model/password_model.dart';
import 'package:password_generator/src/modules/passwords/repository/passwords_repository.dart';

class PasswordsController extends ChangeNotifier {
  PasswordsController(this._repository) {
    getAllPasswords();
  }

  final PasswordsRepository _repository;
  List<PasswordModel> _passwords = [];

  List<PasswordModel> get passwords => _passwords;

  void getAllPasswords() async {
    _passwords = _repository.getAllPasswords();
    log("$_passwords", name: "\$getAllPasswords");
    notifyListeners();
  }

  Future<void> deletePassword(PasswordModel password) async {
    _passwords = await _repository.deletePassword(password);
    notifyListeners();
  }
}
