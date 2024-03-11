import 'package:flutter/material.dart';
import 'package:password_generator/src/modules/home/widgets/check_box_widget.dart';
import 'package:password_generator/src/shared/constant/colors.dart';

class CardCheckBoxWidget extends StatelessWidget {
  const CardCheckBoxWidget({super.key, required this.checkBoxes});
  final List<CheckBoxWidget> checkBoxes;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: red)),
      child: Column(
        children: checkBoxes,
      ),
    );
  }
}
