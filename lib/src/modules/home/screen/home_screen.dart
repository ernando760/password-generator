import 'package:flutter/material.dart';
import 'package:password_generator/src/modules/home/controller/home_controller.dart';

import 'package:password_generator/src/modules/home/widgets/card_character_widget.dart';
import 'package:password_generator/src/modules/home/widgets/cards_check_box_widget.dart';

import 'package:password_generator/src/shared/constant/colors.dart';
import 'package:password_generator/src/shared/widgets/custom_app_bar_widget.dart';
import 'package:password_generator/src/shared/widgets/custom_bottom_navigation_bar_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeController(),
      child: Scaffold(
        backgroundColor: richBlack,
        body: SafeArea(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // app bar
                const Flexible(
                  child: CustomAppBarWidget(title: "Gerador de Senha"),
                ),
                // image lock
                const SizedBox(
                  height: 15,
                ),
                Flexible(
                  child: Image.asset(
                    "assets/images/lock_black.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // card_character
                const Flexible(
                  child: CardCharacterWidget(),
                ),
                const SizedBox(
                  height: 28,
                ),
                // cards
                const Flexible(
                  child: CardsCheckBoxWidget(),
                )
              ],
            ),
          ),
        )),
        bottomNavigationBar: const CustomBottomNavigationBarWidget(),
      ),
    );
  }
}
