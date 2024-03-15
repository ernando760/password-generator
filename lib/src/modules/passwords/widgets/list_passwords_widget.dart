import 'package:flutter/material.dart';
import 'package:password_generator/src/modules/passwords/controller/passwords_controller.dart';
import 'package:password_generator/src/modules/passwords/widgets/card_password_widget.dart';
import 'package:password_generator/src/shared/constant/colors.dart';
import 'package:password_generator/src/shared/constant/text_style.dart';
import 'package:provider/provider.dart';

class ListPasswordsWidget extends StatelessWidget {
  const ListPasswordsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<PasswordsController>();
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .8,
      child: controller.passwords.isEmpty
          ? Center(
              child: Text(
                "Não tem nenhuma senha salva.",
                style: body15SemiBold.copyWith(color: white),
              ),
            )
          : ListView.builder(
              itemCount: controller.passwords.length,
              itemBuilder: (context, index) {
                final password = controller.passwords[index];
                return CardPasswordWidget(passwordModel: password);
              },
            ),
    );
  }
}
