import 'package:flutter/material.dart';
import 'package:password_generator/src/modules/home/controller/home_controller.dart';
import 'package:password_generator/src/modules/home/controller/slider_cotroller.dart';
import 'package:password_generator/src/shared/constant/colors.dart';
import 'package:password_generator/src/shared/constant/text_style.dart';
import 'package:password_generator/src/shared/utils/show_dialog_password_generated.dart';
import 'package:provider/provider.dart';

class PasswordGeneratorButtomWidget extends StatelessWidget {
  const PasswordGeneratorButtomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    final homeContoller = context.watch<HomeController>();
    return SizedBox(
        width: sizeOf.width * .8,
        child: ElevatedButton(
          onPressed: homeContoller.types.isNotEmpty
              ? () {
                  homeContoller.generate(
                      length: context.read<SliderController>().valueToString);
                  showDialogPasswordGenerated(
                    context,
                    homeContoller.password,
                    onSave: (password) async {
                      final messenger = ScaffoldMessenger.of(context);
                      final nav = Navigator.of(context);
                      await homeContoller.savePassword();
                      messenger.showSnackBar(const SnackBar(
                          elevation: 9, content: Text("A senha foi salva")));
                      nav.pop();
                    },
                  );
                }
              : null,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey[400];
                }

                return red;
              }),
              shadowColor:
                  MaterialStatePropertyAll(Colors.black.withOpacity(.25)),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))),
          child: Text(
            "Gerar",
            style: body15SemiBold.copyWith(
                color: homeContoller.types.isNotEmpty ? white : richBlack),
          ),
        ));
  }
}
