import 'package:flutter/material.dart';
import 'package:password_generator/src/modules/home/model/password_generator_model.dart';
import 'package:password_generator/src/modules/home/widgets/card_check_box_widget.dart';
import 'package:password_generator/src/modules/home/widgets/check_box_widget.dart';

class CardsCheckBoxWidget extends StatelessWidget {
  const CardsCheckBoxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      width: sizeOf.width * .8,
      child: const Row(
        children: [
          Flexible(
            child: CardCheckBoxWidget(
              checkBoxes: [
                CheckBoxWidget(
                    typesGenerate: TypesGenerate.upperCase, label: "ABC"),
                CheckBoxWidget(
                    typesGenerate: TypesGenerate.lowerCase, label: "abc")
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            child: CardCheckBoxWidget(
              checkBoxes: [
                CheckBoxWidget(
                    typesGenerate: TypesGenerate.number, label: "123"),
                CheckBoxWidget(
                    typesGenerate: TypesGenerate.symbols, label: "!#\$")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
