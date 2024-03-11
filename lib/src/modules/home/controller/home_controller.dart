import 'package:flutter/material.dart';

import 'package:password_generator/src/modules/home/model/password_generator_model.dart';

class HomeController extends ChangeNotifier {
  Set<TypesGenerate> types = {TypesGenerate.upperCase};
  late final _passwordGenerator = PasswordGeneratorModel();
  double max = 3.2;
  double min = 0.5;
  double value = 1.6;
  String get valueToString => (value * 10).toStringAsFixed(0);

  String get password => _passwordGenerator.password;

  bool containsType(TypesGenerate type) {
    return types.contains(type);
  }

  void generate({required String length}) {
    _passwordGenerator.setLength(int.parse(length));
    _passwordGenerator.generate(types);
    notifyListeners();
  }

  void toggleType(TypesGenerate type) {
    if (types.contains(type)) {
      types.remove(type);

      notifyListeners();
      return;
    }
    types.add(type);
    notifyListeners();
  }
}
