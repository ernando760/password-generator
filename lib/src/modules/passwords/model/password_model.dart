// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class PasswordModel {
  final String password;
  final bool isVisibility;

  PasswordModel({required this.password, this.isVisibility = false});

  PasswordModel copyWith({
    ValueGetter<String>? password,
    ValueGetter<bool>? isVisibility,
  }) {
    return PasswordModel(
      password: password != null ? password() : this.password,
      isVisibility: isVisibility != null ? isVisibility() : this.isVisibility,
    );
  }

  @override
  String toString() =>
      'PasswordModel(password: $password, isVisibility: $isVisibility)';
}
