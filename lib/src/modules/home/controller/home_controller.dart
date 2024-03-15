import 'package:flutter/material.dart';

import 'package:password_generator/src/modules/home/model/password_generator_model.dart';
import 'package:password_generator/src/modules/home/repository/home_repository.dart';

class HomeController extends ChangeNotifier {
  HomeController(this._repository);
  final HomeRepository _repository;

  Set<GenerateTypes> types = {GenerateTypes.upperCase};
  late final _passwordGenerator = PasswordGeneratorModel();

  String get password => _passwordGenerator.password;

  bool containsType(GenerateTypes type) {
    return types.contains(type);
  }

  Future<void> savePassword() async {
    await _repository.savePassword(password);
    notifyListeners();
  }

  void generate({required String length}) {
    _passwordGenerator.setLength(int.parse(length));
    _passwordGenerator.generate(types);
    notifyListeners();
  }

  void toggleType(GenerateTypes type) {
    if (types.contains(type)) {
      types.remove(type);

      notifyListeners();
      return;
    }
    types.add(type);
    notifyListeners();
  }
}
