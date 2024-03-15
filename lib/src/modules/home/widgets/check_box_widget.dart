import 'package:flutter/material.dart';
import 'package:password_generator/src/modules/home/controller/home_controller.dart';
import 'package:password_generator/src/modules/home/model/password_generator_model.dart';
import 'package:password_generator/src/shared/constant/colors.dart';
import 'package:password_generator/src/shared/constant/text_style.dart';
import 'package:provider/provider.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({
    super.key,
    required this.typesGenerate,
    required this.label,
  });
  final GenerateTypes typesGenerate;
  final String label;
  @override
  Widget build(BuildContext context) {
    final homeController = context.watch<HomeController>();
    final isSelected = homeController.containsType(typesGenerate);
    return Row(
      children: [
        Checkbox(
          value: isSelected,
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return red;
            }
            return red.withOpacity(.25);
          }),
          side: const BorderSide(width: .5, color: red),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          onChanged: (_) {
            homeController.toggleType(typesGenerate);
          },
        ),
        Text(
          label,
          style: body12medium.copyWith(color: white),
        )
      ],
    );
  }
}
