import 'package:flutter/material.dart';
import 'package:password_generator/src/modules/home/controller/slider_cotroller.dart';
import 'package:password_generator/src/shared/constant/colors.dart';
import 'package:provider/provider.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SliderController>();
    return SizedBox(
      child: Slider(
        max: controller.max,
        min: controller.min,
        value: controller.value,
        thumbColor: red,
        inactiveColor: red.withOpacity(.25),
        activeColor: red,
        onChanged: controller.setValue,
      ),
    );
  }
}
