import 'package:flutter/material.dart';
import 'package:password_generator/src/modules/passwords/widgets/list_passwords_widget.dart';
import 'package:password_generator/src/shared/constant/colors.dart';
import 'package:password_generator/src/shared/widgets/custom_app_bar_widget.dart';

class PasswordsScreen extends StatelessWidget {
  const PasswordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: richBlack,
      body: Center(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomAppBarWidget(title: "Suas Senhas"),
            SizedBox(
              height: 35,
            ),
            Flexible(
              child: ListPasswordsWidget(),
            )
          ],
        )),
      ),
    );
  }
}
