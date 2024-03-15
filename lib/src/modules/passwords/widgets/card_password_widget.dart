import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password_generator/src/modules/passwords/controller/passwords_controller.dart';
import 'package:password_generator/src/modules/passwords/controller/visibility_password_controller.dart';
import 'package:password_generator/src/modules/passwords/model/password_model.dart';
import 'package:password_generator/src/shared/constant/colors.dart';
import 'package:password_generator/src/shared/constant/text_style.dart';
import 'package:password_generator/src/shared/widgets/custom_icon_button_widget.dart';
import 'package:provider/provider.dart';

class CardPasswordWidget extends StatelessWidget {
  const CardPasswordWidget({super.key, required this.passwordModel});
  final PasswordModel passwordModel;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => VisibilityPasswordController(passwordModel),
        builder: (context, _) {
          final controller = context.watch<VisibilityPasswordController>();
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: const BoxDecoration(
                color: gray,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 250),
                  child: Visibility(
                    visible: controller.value.isVisibility,
                    replacement: Container(
                      width: 250,
                      height: 15,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(.8),
                                Colors.black.withOpacity(.6),
                                Colors.black.withOpacity(.3),
                              ])),
                    ),
                    child: Text(
                      passwordModel.password,
                      style: body30Medium.copyWith(
                          fontSize: 15,
                          color: white,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ),
                Row(
                  children: [
                    CustomIconButtonWidget(
                        onPressed: () async {
                          final messenger = ScaffoldMessenger.of(context);
                          await Clipboard.setData(
                              ClipboardData(text: passwordModel.password));
                          messenger.showSnackBar(const SnackBar(
                              elevation: 9,
                              content: Text("A senha foi copiada")));
                        },
                        icon: Icons.copy,
                        backgroundColor: orange),
                    CustomIconButtonWidget(
                        onPressed: controller.toggleVisibity,
                        icon: controller.value.isVisibility
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        iconColor: richBlack,
                        backgroundColor: white),
                    CustomIconButtonWidget(
                        onPressed: () async => context
                            .read<PasswordsController>()
                            .deletePassword(passwordModel),
                        icon: Icons.delete,
                        backgroundColor: red),
                  ],
                )
              ],
            ),
          );
        });
  }
}
