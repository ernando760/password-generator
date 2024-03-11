import 'package:flutter/material.dart';

class SliderController extends ValueNotifier<double> {
  double max = 3.2;
  double min = 0.5;
  SliderController({double valueDefault = 1.6}) : super(valueDefault);

  String get valueToString => (value * 10).toStringAsFixed(0);

  void setValue(double newValue) {
    value = newValue;
  }
}
