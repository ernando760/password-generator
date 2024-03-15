import 'package:flutter/material.dart';
import 'package:password_generator/src/modules/passwords/model/password_model.dart';

class VisibilityPasswordController extends ValueNotifier<PasswordModel> {
  VisibilityPasswordController(
    super.value,
  );

  void toggleVisibity() {
    value = value.copyWith(isVisibility: () => !value.isVisibility);
  }
}
