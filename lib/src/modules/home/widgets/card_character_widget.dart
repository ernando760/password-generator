import 'package:flutter/material.dart';
import 'package:password_generator/src/modules/home/controller/slider_cotroller.dart';
import 'package:password_generator/src/modules/home/widgets/password_generator_buttom_widget.dart';
import 'package:password_generator/src/modules/home/widgets/slider_widget.dart';
import 'package:password_generator/src/shared/constant/colors.dart';
import 'package:password_generator/src/shared/constant/text_style.dart';
import 'package:provider/provider.dart';

class CardCharacterWidget extends StatelessWidget {
  const CardCharacterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return ChangeNotifierProvider(
      create: (context) => SliderController(),
      builder: (context, _) {
        final controller = context.watch<SliderController>();
        return Container(
          width: sizeOf.width * .8,
          padding: const EdgeInsets.fromLTRB(24, 35, 24, 18),
          decoration: BoxDecoration(
            border: Border.all(color: red),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // char limits
              Text(
                "Limites de caracteres",
                style: headLine20SemiBold.copyWith(color: white),
              ),
              // length
              Text(
                controller.valueToString,
                style: body30Medium.copyWith(color: white),
              ),
              // slider
              const SliderWidget(),
              // btn generate
              const PasswordGeneratorButtomWidget(),
            ],
          ),
        );
      },
    );
  }
}
